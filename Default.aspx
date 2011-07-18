<%@ Page Language="C#" AutoEventWireup="true"  CodeFile="Default.aspx.cs" Inherits="_Default" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">

<head runat="server">
        <title>Date Graph</title>
        <style type="text/css" media="screen">
            #holder {
                height: 300px;
                margin: 0px 0 0 0px;
                width: 620px;
            }
        </style>
        <script src="raphael.js" type="text/javascript"></script>
        <script type="text/javascript" charset="utf-8">
            window.onload = function () {
                var r = Raphael("holder", 620, 300),
                    e = [],
                    clr = [],
                    months = ["January", "February", "March", "April", "May", "June", "July", "August", "September", "October", "November", "December"],
                    years = ["2008","2009","2010","2011"],
                    values = [],
                    now = 0,
                    nowY=0,
                    
                    Line = r.path("M10 250L650 250").attr({fill: "#000", stroke: "#000", "stroke-width": 2}),
                    Line = r.path("M10 229L650 229").attr({fill: "#000", stroke: "#000",opacity: .3}),
                    Line = r.path("M10 208L650 208").attr({fill: "#000", stroke: "#000",opacity: .3}),
                    Line = r.path("M10 187L650 187").attr({fill: "#000", stroke: "#000",opacity: .3}),
                    Line = r.path("M10 166L650 166").attr({fill: "#000", stroke: "#000",opacity: .3}),
                    Line = r.path("M10 145L650 145").attr({fill: "#000", stroke: "#000",opacity: .3}),
                    Line = r.path("M10 124L650 124").attr({fill: "#000", stroke: "#000",opacity: .3}),
                    Line = r.path("M10 103L650 103").attr({fill: "#000", stroke: "#000",opacity: .3}),
                    Line = r.path("M10 82L650 82").attr({fill: "#000", stroke: "#000",opacity: .3}),
                    Line = r.path("M10 61L650 61").attr({fill: "#000", stroke: "#000",opacity: .3}),
                    Line = r.path("M10 40L650 40").attr({fill: "#000", stroke: "#000",opacity: .3}),
                    
                    Line = r.path("M10 250L10 10").attr({fill: "#000", stroke: "#000", "stroke-width": 2}),
                    Line = r.path("M610 250L610 30").attr({fill: "#000", stroke: "#000",opacity: .3}),
                    Line = r.path("M550 250L550 30").attr({fill: "#000", stroke: "#000",opacity: .3}),
                    Line = r.path("M490 250L490 30").attr({fill: "#000", stroke: "#000",opacity: .3}),
                    Line = r.path("M430 250L430 30").attr({fill: "#000", stroke: "#000",opacity: .3}),
                    Line = r.path("M370 250L370 30").attr({fill: "#000", stroke: "#000",opacity: .3}),
                    Line = r.path("M310 250L310 30").attr({fill: "#000", stroke: "#000",opacity: .3}),
                    Line = r.path("M250 250L250 30").attr({fill: "#000", stroke: "#000",opacity: .3}),
                    Line = r.path("M190 250L190 30").attr({fill: "#000", stroke: "#000",opacity: .3}),
                    Line = r.path("M130 250L130 30").attr({fill: "#000", stroke: "#000",opacity: .3}),
                    Line = r.path("M70 250L70 30").attr({fill: "#000", stroke: "#000",opacity: .3}),
                    
                    txt = r.text(10,257,"1"),txt = r.text(30,257,"2"),txt = r.text(50,257,"3"),
                    txt = r.text(70,257,"4"),txt = r.text(90,257,"5"),txt = r.text(110,257,"6"),
                    txt = r.text(130,257,"7"),txt = r.text(150,257,"8"),txt = r.text(170,257,"9"),
                    txt = r.text(190,257,"10"),txt = r.text(210,257,"11"),txt = r.text(230,257,"12"),
                    txt = r.text(250,257,"13"),txt = r.text(270,257,"14"),txt = r.text(290,257,"15"),
                    txt = r.text(310,257,"16"),txt = r.text(330,257,"17"),txt = r.text(350,257,"18"),
                    txt = r.text(370,257,"19"),txt = r.text(390,257,"20"),txt = r.text(410,257,"21"),
                    txt = r.text(430,257,"22"),txt = r.text(450,257,"23"),txt = r.text(470,257,"24"),
                    txt = r.text(490,257,"25"),txt = r.text(510,257,"26"),txt = r.text(530,257,"27"),
                    txt = r.text(550,257,"28"),txt = r.text(570,257,"29"),txt = r.text(590,257,"30"),
                    txt = r.text(610,257,"31"),
                    
                    
                    bg = r.rect(343, 274, 134, 26, 13).attr({fill: "#666", stroke: "none"}),
                    month = r.text(410, 287, months[now]).attr({fill: "#fff", stroke: "none", "font": '100 15px "Helvetica Neue", Helvetica, "Arial Unicode MS", Arial, sans-serif'}),
                    rightc = r.circle(464, 287, 10).attr({fill: "#fff", stroke: "none"}),
                    right = r.path("M460,282l10,5 -10,5z").attr({fill: "#000"}),
                    leftc = r.circle(356, 287, 10).attr({fill: "#fff", stroke: "none"}),
                    left = r.path("M360,282l-10,5 10,5z").attr({fill: "#000"}),
                    bgY = r.rect(143, 274, 134, 26, 13).attr({fill: "#666", stroke: "none"}),
                    year = r.text(210, 287, years[nowY]).attr({fill: "#fff", stroke: "none", "font": '100 15px "Helvetica Neue", Helvetica, "Arial Unicode MS", Arial, sans-serif'}),
                    rightcY = r.circle(264, 287, 10).attr({fill: "#fff", stroke: "none"}),
                    rightY = r.path("M260,282l10,5 -10,5z").attr({fill: "#000"}),
                    leftcY = r.circle(156, 287, 10).attr({fill: "#fff", stroke: "none"}),
                    leftY = r.path("M160,282l-10,5 10,5z").attr({fill: "#000"}),
                    c = r.path("M0,0").attr({fill: "none", "stroke-width": 3}),
                    bg = r.path("M0,0").attr({stroke: "none", opacity: .3}),
                    dotsy = [];
                function randomPath(length, j) {
                    var path = "",
                        x = 10,
                        y = 0;
                    dotsy[j] = dotsy[j] || [];
                    for (var i = 0; i < length; i++) {
                        dotsy[j][i] = Math.round(Math.random() * 200);
                        if (i) {
                            path += "C" + [x + 10, y, (x += 20) - 10, (y = 240 - dotsy[j][i]), x, y];
                        } else {
                            path += "M" + [10, (y = 240 - dotsy[j][i])];
                        }
                    }
                    return path;
                }
                for (var i = 0; i < 12; i++) {
                    values[i] = randomPath(31, i);
                    clr[i] = Raphael.getColor(1);
                }
                c.attr({path: values[0], stroke: clr[0]});
                bg.attr({path: values[0] + "L610,250 10,250z", fill: clr[0]});
                //month.attr({fill: clr[0]});
                var animation = function () {
                    var time = 1000;
                    if (now == 12) {
                        now = 0;
                    }
                    if (now == -1) {
                        now = 11;
                    }
                    c.animate({path: values[now], stroke: clr[now]}, time, "<>");
                    bg.animate({path: values[now] + "L610,250 10,250z", fill: clr[now]}, time, "<>");
                    month.attr({text: months[now]});
                };
            	var animationY = function () {
                    var time = 1000;
                    if (nowY == 4) {
                        nowY = 0;
                    }
                    if (nowY == -1) {
                        nowY = 3;
                    }
                    c.animate({path: values[nowY], stroke: clr[nowY]}, time, "<>");
                    bg.animate({path: values[nowY] + "L610,250 10,250z", fill: clr[nowY]}, time, "<>");
                    year.attr({text: years[nowY]});
                };
                rightc.node.onclick = right.node.onclick = function () {
                	now++;
                    animation();
                };
                leftc.node.onclick = left.node.onclick = function () {
                    now--;
                    animation();
                };
                rightcY.node.onclick = rightY.node.onclick = function () {
                    nowY++;
                    animationY();
                };
                leftcY.node.onclick = leftY.node.onclick = function () {
                    nowY--;
                    animationY();
                };
                
                document.onclicks = function () {
                    var path = r.parsePathString(values[now]),
                        x = path[1][5] - 31,
                        y = path[1][6];
                    path = r.pathToRelative(path);
                    path[1][0] = "m";
                    path[1].splice(1, 5, 0);
                    var newvalue = Math.round(Math.random() * 200) - 100;
                    path = path.join(",") + "c10,0 10," + newvalue + " 20," + newvalue;
                    c.animate({path: path}, 2000);
                    r.safari();
                };
            };
        </script>
</head>
<body>
    <div id="holder"></div>
</body>
</html>
