<%-- 
    Document   : Exercise3
    Created on : Apr 9, 2023, 4:43:55 PM
    Author     : komar
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Exercise 3</title>
        
        <style>
            body{
                width: 50%;
                margin: auto;
                background-color: azure;
                font-family: arial, sans-serif;
                
                margin-top: 30vh;
            }
            .maintenance {
                position: absolute;
                top: 50%;
                left: 50%;
                transform: translate(-50%, -50%);
                font-size: 24px;
                color: black;
                padding: 8px;
                background-color: lightgray;
                border-radius: 8px;
           
               }

              .maintenance:hover {
                animation-name: move;
                animation-duration: 2s;
                animation-timing-function: ease-in;
                animation-fill-mode: forwards;
              }

              @keyframes move {
                0% {
                  transform: translate(-50%, -50%);
                }
                20% {
                  transform: translateX(-100%);
                }
                25% {
                  transform: translateX(-100%);
                }
                45% {
                  transform: translateX(-50%);
                }
                50% {
                  transform: translateX(-50%);
                }
                70% {
                  transform: translateX(0%);
                }
                75% {
                  transform: translateX(0%);
                }
                95% {
                  transform: translateX(100%);
                }
                100% {
                  transform: translate(-50%, -50%);
                }
              }

              .maintenance:hover:hover:after {
                content: '';
                position: absolute;
                top: -10px;
                left: -10px;
                width: 20px;
                height: 20px;
                border-radius: 50%;
                background-color: #ff0000;
                opacity: 0.5;
                transform: scale(0);
                animation-name: ripple;
                animation-duration: 1s;
                animation-timing-function: ease-out;
                animation-fill-mode: forwards;
              }

              @keyframes ripple {
                0% {
                  transform: scale(0);
                  opacity: 0.5;
                }
                100% {
                  transform: scale(2);
                  opacity: 0;
                }
              }

              @media (min-width: 768px) {
                .maintenance:hover {
                  animation-name: move-reverse;
                  animation-duration: 5s;
                  animation-timing-function: ease-out;
                  animation-fill-mode: forwards;
                }

                @keyframes move-reverse {
                  0% {
                    transform: translate(-50%, -50%);
                  }
                  20% {
                    transform: translateX(100%);
                  }
                  25% {
                    transform: translateX(100%);
                  }
                  45% {
                    transform: translateX(50%);
                  }
                  50% {
                    transform: translateX(50%);
                  }
                  70% {
                    transform: translateX(0%);
                  }
                  75% {
                    transform: translateX(0%);
                  }
                  95% {
                    transform: translateX(-100%);
                  }
                  100% {
                    transform: translate(-50%, -50%);
                  }
                }
              }

/*            #play{
                background-color: lightblue;
                position: absolute;
                right: 50%;
    
                width: fit-content;
                padding: 8px;
                border-radius: 8px;
                transition: right 5s;
            }
            #play:hover{
                right: 100%;
            }
            #play::after{
                content: " ";
                width: 50px;
                height: 50px;
                background-color: black;
                position: absolute;  
            }
            #play::before{
                content: " ";
                width: 50px;
                height: 50px;
                background-color: black;
                position: absolute;  
            }*/
        </style>
    </head>
    <body>
        <div class="maintenance"> Under Maintenance ...</div>
    </body>
    <script type="text/javascript">
        const maintenanceDiv = document.getElementById("maintenance");

        function moveMaintenanceDiv() {
          const screenWidth = window.innerWidth;
          const screenHeight = window.innerHeight;
          const newX = Math.floor(Math.random() * (screenWidth - maintenanceDiv.offsetWidth));
          const newY = Math.floor(Math.random() * (screenHeight - maintenanceDiv.offsetHeight));
          maintenanceDiv.style.top = `${newY}px`;
          maintenanceDiv.style.left = `${newX}px`;
        }

        setInterval(moveMaintenanceDiv, 1000);
        
    </script>
</html>
