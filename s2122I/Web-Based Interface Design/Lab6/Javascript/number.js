const num = Math.ceil(Math.random() *10);
const gnum = prompt("Guess the number between 1 and 10 inclusive");
if(gnum == num){
    document.write("Matched");
}else{
    document.write("Not matched, the number was "+ num);
}