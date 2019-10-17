 var player = 1;
 var flag=0;
 var counter=0;
var box_f = ["","","",
                "","","",
                "","",""];

function display_input(box){ 

    var element = document.getElementById(box);

    //If the element already contains something, then we don't change it
    if(element.innerHTML != "") return;
    if(flag==1) return;
    counter++;
    if(player == 1) {
        element.innerHTML = "X";
        box_f[box]="X";
         console.log(box_f[box]);
        player = 2;
    }
    else {
        element.innerHTML = "O";
        box_f[box]="O";
        console.log(box_f[box]);
        player = 1;
    }
    if (wincase("X"))
    {
    console.log("Player 1 is winner");
    window.alert("Player 1 is winner!!");
    flag=1; }
    else if (wincase("O"))
    { console.log("Player 2 is winner");
    window.alert("Player 2 is winner!!");
        flag = 1; }
    else if (counter == 9)
    {
        console.log("Game is draw!!");
        window.alert("Game is Draw!!");
    }
}

function mouseOver(id) {
   if(box_f[id]==""){
       if(player==1){
         document.getElementById(id).innerHTML =  "X".fontsize("500%");
       }
         else if (player==2){
            document.getElementById(id).innerHTML = "O".fontsize("500%");      
        
        }
    }
}
  
function mouseOut(id) {
    document.getElementById(id).style.fontSize("200%");
  }
  

function wincase(p)
{  
    if ( ((box_f[0]==p) && (box_f[0]==box_f[1]) && (box_f[0]==box_f[2]))||
            ((box_f[3]==p) && (box_f[3]==box_f[4]) && (box_f[3]==box_f[5]))||
            ((box_f[6]==p) && (box_f[6]==box_f[7]) && (box_f[6]==box_f[8]))||
            ((box_f[0]==p) && (box_f[0]==box_f[3]) && (box_f[0]==box_f[6]))||
            ((box_f[1]==p) && (box_f[1]==box_f[4]) && (box_f[1]==box_f[7]))||
            ((box_f[2]==p) && (box_f[2]==box_f[5]) && (box_f[2]==box_f[8]))||
            ((box_f[0]==p) && (box_f[0]==box_f[4]) && (box_f[0]==box_f[8]))||
            ((box_f[2]==p) && (box_f[2]==box_f[4]) && (box_f[2]==box_f[6])) )
    { return 1; }
    else
    return 0;
    
}
