 var player = 1;
 var flag=0;
 var counter=0;
var box_f = ["","","","","","","","",""];

$(document).ready(function(){

    $("td").click( function(){
        var box = $(this).attr("id");

        //If the element already contains something, then we don't change it
        if(box_f[box] != "") return;
        if(flag==1) return;
            counter++;
        if(player == 1) {
            $("#" + box).html("X");
            box_f[box]="X";
            player = 2; }

        else {
            $("#" + box).html("O");
            box_f[box]="O";
            player = 1; }

        if (wincase("X"))
        {   alert("Player 1 is winner!!");
            flag=1; }
        
        else if (wincase("O"))
        {   alert("Player 2 is winner!!");
            flag = 1; }
        
        else if (counter == 9)
        {   alert("Game is Draw!!");    }
    } );
    
    
    $("td").hover(
           function(){
            var id = $(this).attr("id");
            if(box_f[id]=="" && flag!=1){
                if(player==1){
                    $("#" + id).html("X");  }
                else if (player==2){
                     $("#" + id).html("O"); }
            }
           },
           function(){
            var id = $(this).attr("id");
            if(box_f[id]=="")
            $("#" + id).html(""); }
        );
}
);

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
