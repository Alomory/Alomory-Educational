document.addEventListener("deviceready", onDeviceReady, false);

function onDeviceReady() {
  // Cordova is now initialized. Have fun!
  
  
  var media = new Media("sounds/click.wav",
    // Success callback
    function() {
      console.log("Sound played successfully");
    },
    // Error callback
    function(error) {
      console.error("Error playing sound: " + JSON.stringify(error));
    }
  );

  var playButton = document.getElementById("playButton");
  playButton.addEventListener("click", function() {
    media.play();
  });
}
  

