var i = 0;
function move(){
    if(i == 0){
        i =1;
        var elem = document.getElementById("myBar");
        var width = 1;
        var id = setInterval(fram,10);
        function fram(){
            if(width >= 100){
                clearInterval(id);
                i =0;
            }else {
                width++;
                elem.style.width = width+"%";
            }
        }
    }
}