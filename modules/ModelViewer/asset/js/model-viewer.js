"use strict";

// Currently, the config is defined inside the html via js variable "modelViewerOptions".

document.addEventListener('DOMContentLoaded', function(event) {

    // The config is defined inside the html.
    if (typeof modelViewerOptions === 'undefined') {
        return;
    }

    console.log(modelViewerOptions);

    function createScene(options) {

        // ===== //
        // Setup //
        // ===== //

        const modelSource = options.source;
        if (!modelSource) {
            console.log('No source.');
            return;
        }

        const viewerElement = document.getElementById(options.id);
        if (!viewerElement) {
            console.log('No container.');
            return;
        }

        if (!document.querySelector('#' + options.id + ' canvas')) {
            viewerElement.appendChild(document.createElement('canvas'));
        }
        const canvas = document.querySelector('#' + options.id + ' canvas');

        const background = options.config && options.config.background && options.config.background.length
            ? options.config.background : 'white';

        const modelScale = options.config && options.config.scale
            ? options.config.scale
            : 1;

        // const hasMatCap = options.config && options.config.import && options.config.import.loaders && options.config.import.loaders
        //     ? options.config.import.loaders.includes('EXRLoader')
        //     : false;
        const matcapTextureFile = options.config && options.config.matcap_texture
            ? options.config.matcap_texture
            : null;

        const controls = options.config && options.config.import && options.config.import.controls && options.config.import.controls.length
            ? options.config.import.controls
            : null;
        var useOrbitControls = true;

        // Don't load animation two times with FirstPersonControls.
        var animationDuration = 0;

        const scene = new THREE.Scene();
        scene.background = new THREE.Color(background);

        // ====== //
        // Loader //
        // ====== //

        const manager = new THREE.LoadingManager();
        const progressLoader = document.createElement('div');
        {
            progressLoader.className = 'loader';
            let progressMessage = document.createElement('p');
            progressMessage.appendChild(document.createTextNode('Loading'));
            progressLoader.appendChild(progressMessage);

            let progress = document.createElement('div');
            progress.id = 'progress';
            progress.className = 'progress';

            var progressBar = document.createElement('div');
            progressBar.id = 'progress-bar';
            progressBar.className = 'progress-bar';

            progress.appendChild(progressBar);
            progressLoader.appendChild(progress);
            viewerElement.appendChild(progressLoader);

            manager
                .onProgress = function (item, loaded, total) {
                    progressBar.style.width = (loaded / total * 100) + '%';
                };
            manager
                .onError = function (url) {
                    // The errors are already in the console.
                    if (viewerElement.getElementsByTagName('canvas').length) {
                        viewerElement.innerHTML = 'Cannot load:';
                        viewerElement.style.height = 'auto';
                        viewerElement.style.color = '#a91919';
                        viewerElement.style.display = 'block';
                        viewerElement.classList.add('error');
                        viewerElement.innerHTML +='<ul></ul>';
                    }
                    viewerElement.getElementsByTagName('ul')[0].innerHTML += '<li>' + url + "</li>\n";
                };
            manager
                .onLoad = function() {
                    updateSizes();
                };
        }

        // ======= //
        // Buttons //
        // ======= //

        function toggleMode() {
            if (useOrbitControls) {
                enableFirstPersonControls();
            } else {
                enableOrbitControls();
            }
            useOrbitControls = !useOrbitControls;
        }

        let button = document.createElement('div');
        button.className = 'model-button button-fullscreen';
        viewerElement.appendChild(button);

        // The switcher is used only when no specific control is set.
        var buttonMode1;
        var buttonMode2;
        if (!controls) {
            button = document.createElement('div');
            button.className = 'model-button button-mode1';
            viewerElement.appendChild(button);

            button = document.createElement('div');
            button.className = 'model-button button-mode2';
            viewerElement.appendChild(button);

            buttonMode1 = document.getElementsByClassName('button-mode1').item(0);
            buttonMode2 = document.getElementsByClassName('button-mode2').item(0);

            buttonMode1.addEventListener('click', toggleMode);
            buttonMode2.addEventListener('click', toggleMode);
        }

        // ======== //
        // Renderer //
        // ======== //

        const renderer = new THREE.WebGLRenderer({
            canvas: canvas,
            // TODO Disable antialias on low mobile devices.
            antialias: true,
            alpha: true,
        });
        renderer.setPixelRatio(window.devicePixelRatio);
        // renderer.setSize(window.innerWidth, window.innerHeight);
        renderer.setSize(canvas.clientWidth, canvas.clientHeight);
        renderer.setClearColor(scene.background, 1);
        renderer.shadowMap.enabled = true;

        renderer.outputEncoding = THREE.sRGBEncoding;
        // renderer.toneMappingExposure = 1.0;
        // renderer.toneMapping = THREE.ACESFilmicToneMapping;
        // renderer.gammaFactor = 2.2;
        // Do not use.
        // renderer.physicallyCorrectLights = true;

        //====== //
        // Sizes //
        // ===== //

        // TODO Check previous code where there is a computation of the optimal size (frameArea) for the camera (globally and each object).

        var sizes = {};

        // ======= //
        // Cameras //
        // ======= //

        const defaultCameras = [
            {
                type: 'PerspectiveCamera',
                fov: 50,
                aspect: 1,
                near: 0.1,
                far: 2000,
                position: {x: 50, y: 50, z: 80},
                lookAt: {x: 0, y: 0, z: 0},
            }
        ];
        var cameras = options.config && options.config.cameras && options.config.cameras.length
            ? options.config.cameras
            : defaultCameras;
        if (!(cameras instanceof Array)) {
            cameras = [cameras];
        }

        cameras.forEach((camera, index) => {
            const near = typeof camera.near === 'undefined' ? defaultCameras[0].near : camera.near;
            const far = typeof camera.far === 'undefined' ? defaultCameras[0].far : camera.far;
            const position = typeof camera.position === 'undefined' ? defaultCameras[0].position : camera.position;
            const lookAt = typeof camera.lookAt === 'undefined' ? defaultCameras[0].lookAt : camera.lookAt;
            if (camera.type === 'PerspectiveCamera') {
                const fov = typeof camera.fov === 'undefined' ? defaultCameras[0].fov : camera.fov;
                const aspect = typeof camera.aspect === 'undefined' ? defaultCameras[0].aspect : camera.aspect;
                camera = new THREE.PerspectiveCamera(fov, aspect, near, far);
                camera.position.set(position.x, position.y, position.z);
                camera.lookAt(lookAt.x, lookAt.y, lookAt.z);
                scene.add(camera);
                cameras[index] = camera;
            } else if (camera.type === 'OrthographicCamera') {
                const left = typeof camera.left === 'undefined' ? -100 : camera.left;
                const right = typeof camera.right === 'undefined' ? 100 : camera.right;
                const top = typeof camera.top === 'undefined' ? 100 : camera.top;
                const bottom = typeof camera.bottom === 'undefined' ? -100 : camera.bottom;
                camera = new THREE.OrthographicCamera(left, right, top, bottom, near, far);
                camera.position.set(position.x, position.y, position.z);
                camera.lookAt(lookAt.x, lookAt.y, lookAt.z);
                scene.add(camera);
                cameras[index] = camera;
            }
        });

        var camera = cameras[0];
        if (typeof camera !== 'object' || !(camera instanceof THREE.Camera)) {
            console.log('Using default camera.');
            camera = new THREE.PerspectiveCamera();
            camera.position.set(50, 50, 80);
            camera.lookAt(0, 0, 0);
            scene.add(camera);
        }

        camera.aspect = canvas.clientWidth / canvas.clientHeight;
        camera.updateProjectionMatrix();

        // ================= //
        // Material / MatCap //
        // ================= //

        // const loaderEXR = matcapTextureFile
        //     ? new THREE.EXRLoader(manager).setDataType(THREE.UnsignedByteType)
        //     : null;
        // const matcap = loaderEXR.load(matcapTextureFile)

        const matcap = matcapTextureFile
            ? new THREE.TextureLoader(manager).load(matcapTextureFile)
            : null;

        // ====== //
        // Meshes //
        // ====== //

        let anisotropy;
        anisotropy = renderer.capabilities.getMaxAnisotropy();

        let model;

        if (!options.mediaType
            || options.mediaType === 'model/gltf-binary'
            || options.mediaType === 'model/gltf+json'
            || options.mediaType === 'model/gltf'
        ) {
            const loader = new THREE.GLTFLoader(manager);
            loader
                .load(
                    modelSource,
                    gltf => {
                        model = gltf.scene;
                        model.scale.set(modelScale, modelScale, modelScale);

                        model.traverse((child) => {
                            if (child instanceof THREE.Mesh) {
                                if (matcap) {
                                    child.material = new THREE.MeshMatcapMaterial({
                                        map: child.material.map,
                                        matcap: matcap,
                                        color: new THREE.Color().setHex(0xffffff).convertSRGBToLinear(),
                                    });
                                } else {
                                    child.material = new THREE.MeshStandardMaterial({
                                        map: child.material.map,
                                    });
                                }
                                if (child.material.map) {
                                    // child.material.map.magFilter = THREE.NearestFilter;
                                    // child.material.map.minFilter = THREE.LinearMipMapLinearFilter;
                                    child.material.map.anisotropy = anisotropy / 2;
                                    child.material.side = THREE.DoubleSide;
                                }
                                child.castShadow = true;
                                child.receiveShadow = true;
                            }
                        });

                        setTimeout(() => {
                            animateCamera();
                            progressLoader.style.opacity = 0;
                            setTimeout(() => {
                                progressLoader.style.display = 'none';
                                if (viewerElement.getElementsByClassName('loader').length) {
                                    viewerElement.removeChild(progressLoader);
                                }
                            }, 200);
                        }, 1000);

                        scene.add(model);
                    }
                );
        } else if (options.mediaType === 'model/obj') {
            manager
                .addHandler(/\.dds$/i, new DDSLoader());
            if (options.mtl && options.mtl.length) {
                new THREE.MTLLoader(manager)
                    .load(options.mtl[0], function (materials) {
                        materials.preload();
                        new THREE.OBJLoader(manager)
                            .setMaterials(materials)
                            .load(
                                options.source,
                                function (object) {
                                    scene.add(object);
                                }
                            );
                    });
            } else {
                new THREE.OBJLoader(manager)
                    .load(
                        options.source,
                        function (object) {
                            scene.add(object);
                        }
                    );
            }
        } else if (options.mediaType === 'model/vnd.collada+xml') {
            let colladaScene;
            manager
                .onLoad = function() {
                    scene.add(colladaScene);
                };
            if (options.mtl && options.mtl.length) {
                new THREE.MTLLoader(manager)
                    .load(
                        options.mtl[0],
                        function (materials) {
                            materials.preload();
                            new THREE.ColladaLoader(manager)
                                .load(
                                    options.source,
                                    function (collada) {
                                        colladaScene = collada.scene;
                                    }
                                );
                        }
                    );
            } else {
                const loader = new THREE.ColladaLoader(manager);
                loader
                    .load(
                        options.source,
                        collada => {
                            colladaScene = collada.scene;
                        }
                    );
            }
        } else if (options.mediaType === 'model/vnd.filmbox') {
            const loader = new THREE.FBXLoader();
            loader.load(
                options.source,
                function (object) {
                    const mixer = new THREE.AnimationMixer(object);
                    const action = mixer.clipAction(object.animations[0]);
                    action.play();
                    object.traverse(function (child) {
                        if (child.isMesh) {
                            child.castShadow = true;
                            child.receiveShadow = true;
                        }
                    });
                    scene.add(object);
                }
            );
        } else if (options.mediaType === 'application/vnd.threejs+json') {
            const loader = new THREE.VRMLoader();
            loader
                .load(
                    options.source,
                    function (obj) {
                        scene.add(obj);

                        const box = new THREE.Box3().setFromObject(obj);
                        const boxSize = box.getSize(new THREE.Vector3()).length();
                        const boxCenter = box.getCenter(new THREE.Vector3());
                        frameArea(boxSize, boxSize, boxCenter, camera);

                        controls.maxDistance = boxSize * 100;
                        controls.target.copy(boxCenter);
                        controls.update();
                    }
                );
        } else {
            console.log('Media type "' + options.mediaType + '" is unsupported currently.');
            return;
        }

        // ====== //
        // Lights //
        // ====== //

        const defaultLights = [
            {
                type: 'AmbientLight',
                color: 0xffffff,
                intensity: 0.85,
                position: {x: 0, y: 50, z: 15},
            }
        ];

        var lights = options.config && options.config.lights && options.config.lights.length
            ? options.config.lights
            : defaultLights;
        if (!(lights instanceof Array)) {
            lights = [lights];
        }

        lights.forEach((light) => {
            const color = typeof light.color === 'undefined' ? 0xffffff : light.color;
            const intensity = typeof light.intensity === 'undefined' ? 1 : light.intensity;
            const position = typeof light.position === 'undefined' ? {x: 0, y: 0, z: 0} : light.position;
            if (light.type === 'AmbientLight') {
                scene.add(new THREE.AmbientLight(color, intensity));
            } else if (light.type === 'PointLight') {
                light = new THREE.PointLight(color, intensity);
                light.position.set(position.x, position.y, position.z);
                scene.add(light);
            } else if (light.type === 'DirectionalLight') {
                light = new THREE.DirectionalLight(color, intensity);
                light.position.set(position.x, position.y, position.z);
                scene.add(light);
            } else if (light.type === 'architecture') {
                scene.add(new THREE.AmbientLight(0xffffff, 0.85));

                const pointLight2 = new THREE.PointLight(0xffffff, 0.5);
                pointLight2.position.z = 30;

                const lightGroup = new THREE.Group()
                for (var j = 1; j <= 7; j++) {
                    for (var i = 1; i <= 5; i++) {
                        var pointLightTemp = pointLight2.clone();
                        pointLightTemp.castShadow = false;
                        pointLightTemp.position.z = j * 8 - 30;
                        pointLightTemp.intensity = 0.009;
                        pointLightTemp.position.y += 2;
                        pointLightTemp.position.x = i * 6 - 20;
                        pointLightTemp.shadow.mapSize.height = 512;
                        pointLightTemp.shadow.mapSize.width = 512;
                        lightGroup.add(pointLightTemp);
                    }
                }
                lightGroup.rotation.y = -Math.PI / 25;
                scene.add(lightGroup);

                /*
                const pointLightPosition = {x: 0, y: 50, z: 15};

                const pointLight = new THREE.PointLight(0xffffff, 0.5, 100, 1);
                pointLight.position.set(pointLightPosition.x, pointLightPosition.y, pointLightPosition.z);
                pointLight.castShadow = false;
                pointLight.shadow.mapSize.height = 8;
                pointLight.shadow.mapSize.width = 8;

                const pointLight3 = pointLight2.clone();
                pointLight3.position.z = -30;
                // scene.add(pointLight2);
                // scene.add(pointLight3);

                const helper = new THREE.PointLightHelper(pointLight);
                // scene.add(helper);
                // scene.add(pointLight);
                */
            }
        });

        // ======== //
        // Controls //
        // ======== //

        let control;
        let target = new THREE.Vector3(0, 0, 0);

        // TODO Normalize to manage multiple controls params.
        const controlSpeed = options.config && options.config.speed && options.config.speed.control
            ? options.config.speed.control
            : 1;
        const orbitSpeed = options.config && options.config.control && options.config.speed.orbit
            ? options.config.speed.orbit
            : 1;
        const scrollSpeed = options.config && options.config.control && options.config.speed.scroll
            ? options.config.speed.scroll
            : 1;

        function scrollListener(event) {
            camera.getWorldDirection(direction);
            if (event.deltaY < 0) {
                const diffence = Math.abs(camera.position.x - control.target.x)
                    + Math.abs(camera.position.y - control.target.y)
                    + Math.abs(camera.position.z - control.target.z);
                if (diffence < 10) {
                    control.target.addScaledVector(direction, scrollSpeed);
                }
            }
        }

        let euler = new THREE.Euler(0, 0, 0, 'YXZ');
        let rotationSpeed = (Math.PI / 180) / 5;

        function onMouseDown(e) {
            canvas.addEventListener('mousemove', onMouseMove);
        }

        function onMouseMove(e) {
            if (lockCamera == false) {
                const movementX = e.movementX || e.mozMovementX || e.webkitMovementX || 0;
                const movementY = e.movementY || e.mozMovementY || e.webkitMovementY || 0;

                euler.y -= movementX * rotationSpeed;
                euler.x -= movementY * rotationSpeed;
                euler.x = Math.min(Math.max(euler.x, -1.0472), 1.0472);

                camera.quaternion.setFromEuler(euler);
            }
        }

        function enableOrbitControls() {
            if (!controls) {
                buttonMode1.style.opacity = 1;
                buttonMode1.style.pointerEvents = 'all';
                buttonMode2.style.opacity = 0;
                buttonMode2.style.pointerEvents = 'none';
            }

            canvas.removeEventListener('mousedown', onMouseDown);
            canvas.removeEventListener('mouseup', onMouseMove);

            if (control != undefined) {
                control.dispose();
            }

            control = new THREE.OrbitControls(camera, canvas);
            control.zoomSpeed = controlSpeed;
            control.enableDamping = true;
            control.enablePan = true;
            control.target = target;

            canvas.addEventListener('wheel', scrollListener);
        }

        function enableFirstPersonControls() {
            if (!controls) {
                buttonMode1.style.opacity = 0;
                buttonMode1.style.pointerEvents = 'none';
                buttonMode2.style.opacity = 1;
                buttonMode2.style.pointerEvents = 'all';
            }

            animateCamera();
            canvas.removeEventListener('wheel', scrollListener);

            if (control != undefined) {
                control.dispose();
            }

            // control = new PointerLockControls(camera, canvas);
            if (control != undefined) {
                control.enablePan = true;
            }

            canvas.addEventListener('wheel', event => {
                camera.getWorldDirection(direction);
                if (event.deltaY < 0) {
                    camera.position.addScaledVector(direction, controlSpeed);
                } else {
                    const antiDirection = new THREE.Vector3(-direction.x, -direction.y, -direction.z);
                    camera.position.addScaledVector(antiDirection, controlSpeed);
                }
            })

            // canvas.addEventListener('mousedown', () => {
            //     canvas.requestPointerLock();
            //     setTimeout(function () {
            //         document.exitPointerLock();
            //         setTimeout(function () {
            //             canvas.requestPointerLock();
            //         }, 20);
            //     }, 20);
            // });
            // canvas.addEventListener('mouseup', () => {
            //     if (control.unlock) {
            //         control.unlock();
            //     }
            // });

            canvas.addEventListener('mousedown', onMouseDown);;
            canvas.addEventListener('mouseup', function () {
                canvas.removeEventListener('mousemove', onMouseMove);
            });

            canvas.addEventListener('contextmenu', event => {
                event.preventDefault();
            })
        }

        if (controls === 'FirstPersonControls') {
            enableFirstPersonControls();
        } else {
            enableOrbitControls();
        }

        if (control != undefined) {
            control.enabled = false;
        }

        animationDuration = 2;
        var lockCamera = !!options.config.animation;

        function animateCamera() {
            // Don't animate two times on load with firstPersonControls.
            if (!options.config.animation || !animationDuration || typeof gsap === 'undefined') {
                lockCamera = false;
                if (control != undefined) {
                    control.enabled = true;
                }
                return;
            }

            lockCamera = true;
            gsap.to(camera.position, { x: 0, duration: animationDuration });
            gsap.to(camera.position, { y: 0, duration: animationDuration });
            gsap.to(camera.position, { z: 30, duration: animationDuration / 2 });
            gsap.to(camera.quaternion, { x: 0, duration: animationDuration });
            gsap.to(camera.quaternion, { y: 0, duration: animationDuration });
            gsap.to(camera.quaternion, { z: 0, duration: animationDuration });

            if (control != undefined) {
                control.target.set(0, 0, 0);
            }
            camera.lookAt(0, 0, 0);
            setTimeout(() => {
                lockCamera = false;
                if (control != undefined) {
                    control.enabled = true;
                }
            }, animationDuration * 1000);
        }

        if (!options.config.animation) {
            lockCamera = false;
            if (control != undefined) {
                control.enabled = true;
            }
        }

        // ==== //
        // Loop //
        // ==== //

        const direction = new THREE.Vector3;
        const clock = new THREE.Clock();
        const tick = () => {
            // Render.
            renderer.render(scene, camera);

            // Call tick again on the next frame.
            window.requestAnimationFrame(tick);

            // Update control.
            if (useOrbitControls) {
                control.update();
            } else {
                // control.update(clock.getDelta() * 20);
            }
            if (lockCamera) {
                camera.lookAt(0, 0, 0);
            }
        }
        tick();

        // ============ //
        // Resize Event //
        // ============ //

        function updateSizes() {
            // Update size.
            var size = {
                height: canvas.clientHeight,
                width: canvas.clientWidth,
            }

            // Update camera.
            camera.aspect = size.width / size.height;
            camera.updateProjectionMatrix();

            // Update renderer.
            renderer.setSize(size.width, size.height);
            renderer.setPixelRatio(Math.min(window.devicePixelRatio, 2));
        }

        // Update size after init.
        updateSizes();

        window.addEventListener('resize', () => {
            updateSizes();
        })
    }

    function toggleFullscreen() {
        if (!document.fullscreenElement
            && !document.msFullscreenElement
            && !document.mozFullScreenElement
            && !document.webkitFullscreenElement
        ) {
            $('body').addClass('fullscreen');
            $(this).closest('.model-viewer').addClass('fullscreen');
            $(this).closest('.model-viewer').css('height', '');
            $(this).closest('.model-viewer').css('width', '');
            if (document.documentElement.requestFullscreen) {
                document.documentElement.requestFullscreen();
            } else if (document.documentElement.msRequestFullscreen) {
                document.documentElement.msRequestFullscreen();
            } else if (document.documentElement.mozRequestFullScreen) {
                document.documentElement.mozRequestFullScreen();
            } else if (document.documentElement.webkitRequestFullscreen) {
                document.documentElement.webkitRequestFullscreen(Element.ALLOW_KEYBOARD_INPUT);
            } else {
                alert('Fullscreen is not supported.');
            }
        } else {
            exitFullscreen();
        }
    }

    function exitFullscreen() {
        if (!document.fullscreenElement
            && !document.mozFullScreenElement
            && !document.webkitFullscreenElement
            && !document.msFullscreenElement
        ) {
            return;
        }
        if (document.exitFullscreen) {
            document.exitFullscreen();
        } else if (document.msExitFullscreen) {
            document.msExitFullscreen();
        } else if (document.mozCancelFullScreen) {
            document.mozCancelFullScreen();
        } else if (document.webkitExitFullscreen) {
            document.webkitExitFullscreen();
        }
    }

    $('body').on('click', '.model-viewer .button-fullscreen', toggleFullscreen);

    $(document).on('fullscreenchange', function () {
        if (!(document.fullscreenElement
            || document.msFullscreenElement
            || document.mozFullScreenElement
            || document.webkitFullscreenElement)
        ) {
            $('body').removeClass('fullscreen');
            $('.model-viewer').removeClass('fullscreen');
        }
    });

    modelViewerOptions.forEach(function (options, index) {
        createScene(options);
    });

});
