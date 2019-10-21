 var player = 1;
 var flag=0;
 var counter=0;
 var n=4 ;
 var box_f = [];
 for (var l=1; l<=n*n; l++)
    {
        box_f.push("");
    }
    
        document.write("<h1>"+n+"*"+n+" Tic Tac Toe</h1>");
        var k = 0;
        document.write("<table >");
        for(var i = 0; i<n; i++)
        {
            document.write("<tr>");
            for(var j=0; j<n; j++)
            {
                document.write("<td class = 'vert hori' id = " + k + " ></td>");
                k=k+1;
            }
            document.write("</tr>");
        }
        document.write("</table>");
    
        
    
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
        
        else if (counter == n*n)
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
    var win_r = [];
    var win_c = [];
    var win_d1 = 0;
    var win_d2 = 0;
    for (var l=0; l<n; l++)
    {
        win_r[l] = 0;
        win_c[l] = 0;
    }

    for(var i=0; i<n; i++)
    {  for(var j=0;j<n; j++)
        {   if(box_f[i*n+j]==p)
               { win_r[i]++; }
            
            if(box_f[i+n*j]==p) 
                { win_c[i]++; }

            if((i==j)&& (box_f[i*n+j]==p))
                {  win_d1++; }
        }

        if(box_f[(i+1)*(n-1)]==p)
        { win_d2++; }

        if( (win_c[i]==n) || (win_r[i] == n) || (win_d1==n) || (win_d2 == n) )
        { return 1; }
    }
    return 0;
}
