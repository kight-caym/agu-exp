<%@page contentType="text/html" pageEncoding="UTF-8"%>


<%
    twi.Model model = new twi.Model();
    String token = "";
    String stoken = "";
    String tweeet = "";
    token = request.getParameter("oauth_token");
    stoken = request.getParameter("oauth_verifier");
    tweeet = request.getParameter("tweeet");
%>

<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Twitter OAuth認証開始</title>
        <script src="https://d3js.org/d3.v3.min.js" charset="utf-8"></script>
        <script src="d3.layout.cloud.js"></script>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/Chart.js/2.1.4/Chart.min.js"></script>
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>
        <script type="text/javascript" src="jquery.js"></script>
        <script type="text/javascript" src="nicoscreen.js"></script>

        <style type="text/css">
            body{
                background:#eeeeee;
            }
            .col-md-12{
                background: #ffffff;
                padding: 10px;
                text-align: center;
                border-top-left-radius: 2px;
                margin: 30px auto;
                display:inline-block;
            }
            .side{
                width: 100%;
                padding: 20px;
                background: #ffffff;
                text-align: center;
                margin: 30px auto;
            }
            .col1{
                width: 100%;
                margin: 0 auto;
            }
            .col1 li{
                display:inline-block;
                border:1px solid #ccc;
                padding:5px 10px;
                text-align:center;
                background: #ffffff;
            }
        </style>
    </head>
    <body>
        <% if (token == null || stoken == null) {%>
        <p><a href="<%=model.getAuth()%>">Twitter OAuth認証開始</a></p>
        <% } else if (tweeet != null) {%>
        <% model.twi4j();
            model.tweet4(tweeet);%>
        <a class="twitter-timeline" href="https://twitter.com/Umeco_co" data-widget-id="737534269157842944">@Umeco_coさんのツイート</a>
        <script>!function (d, s, id) {
            var js, fjs = d.getElementsByTagName(s)[0], p = /^http:/.test(d.location) ? 'http' : 'https';
            if (!d.getElementById(id)) {
            js = d.createElement(s);
            js.id = id;
            js.src = p + "://platform.twitter.com/widgets.js";
            fjs.parentNode.insertBefore(js, fjs);
            }
            }(document, "script", "twitter-wjs");</script>
            <% } else {%>
            <% model.registerToken(token, stoken);
                model.twi4j();
                model.getTimeline();
                model.printUser();%>
        <div class="side">
            <h2>
                <img  src="dr3eX.png">
            </h2>
        </div>
        <div id="nicoscreen" style="width:sW;height:sH;border: white;">
            <div class="col1">
                <li>
                    <h2>★ワードクラウド★</h2>
                    <svg id="test">
                    </svg>
                </li>
                <li>
                    <h2>★ツイート時間帯の傾向★</h2>
                    <canvas id="twiTime" height="500" width="800"></canvas><br>
                    <script>
                        var ctx = document.getElementById("twiTime");
                        var twiTime = new Chart(ctx, {
                        type: 'bar',
                                data: {
                                labels: ["1時", "2時", "3時", "4時", "5時", "6時", "7時", "8時", "9時", "10時", "11時", "12時", "13時", "14時", "15時", "16時", "17時", "18時", "19時", "20時", "21時", "22時", "23時", "24時"], //x軸のラベル
                                        datasets: [{
                                        label: "あなたのツイート数",
                                                data: [<%=model.timetwi[16]%>, <%=model.timetwi[17]%>, <%=model.timetwi[18]%>, <%=model.timetwi[19]%>, <%=model.timetwi[20]%>, <%=model.timetwi[21]%>, <%=model.timetwi[22]%>, <%=model.timetwi[23]%>,<%=model.timetwi[0]%>, <%=model.timetwi[1]%>,<%=model.timetwi[2]%>,<%=model.timetwi[3]%>,<%=model.timetwi[4]%>, <%=model.timetwi[5]%>, <%=model.timetwi[6]%>, <%=model.timetwi[7]%>, <%=model.timetwi[8]%>, <%=model.timetwi[9]%>, <%=model.timetwi[10]%>, <%=model.timetwi[11]%>, <%=model.timetwi[12]%>, <%=model.timetwi[13]%>, <%=model.timetwi[14]%>, <%=model.timetwi[15]%>],
                                                backgroundColor: [
                                                        'rgba(255, 99, 132, 0.2)',
                                                        'rgba(54, 162, 235, 0.2)',
                                                        'rgba(255, 206, 86, 0.2)',
                                                        'rgba(75, 192, 192, 0.2)',
                                                        'rgba(153, 102, 255, 0.2)',
                                                        'rgba(255, 159, 64, 0.2)',
                                                        'rgba(255, 99, 132, 0.2)',
                                                        'rgba(54, 162, 235, 0.2)',
                                                        'rgba(255, 206, 86, 0.2)',
                                                        'rgba(75, 192, 192, 0.2)',
                                                        'rgba(153, 102, 255, 0.2)',
                                                        'rgba(255, 159, 64, 0.2)',
                                                        'rgba(255, 99, 132, 0.2)',
                                                        'rgba(54, 162, 235, 0.2)',
                                                        'rgba(255, 206, 86, 0.2)',
                                                        'rgba(75, 192, 192, 0.2)',
                                                        'rgba(153, 102, 255, 0.2)',
                                                        'rgba(255, 159, 64, 0.2)',
                                                        'rgba(255, 99, 132, 0.2)',
                                                        'rgba(54, 162, 235, 0.2)',
                                                        'rgba(255, 206, 86, 0.2)',
                                                        'rgba(75, 192, 192, 0.2)',
                                                        'rgba(153, 102, 255, 0.2)',
                                                        'rgba(255, 159, 64, 0.2)'
                                                ],
                                                borderColor: [
                                                        'rgba(255,99,132,1)',
                                                        'rgba(54, 162, 235, 1)',
                                                        'rgba(255, 206, 86, 1)',
                                                        'rgba(75, 192, 192, 1)',
                                                        'rgba(153, 102, 255, 1)',
                                                        'rgba(255, 159, 64, 1)',
                                                        'rgba(255,99,132,1)',
                                                        'rgba(54, 162, 235, 1)',
                                                        'rgba(255, 206, 86, 1)',
                                                        'rgba(75, 192, 192, 1)',
                                                        'rgba(153, 102, 255, 1)',
                                                        'rgba(255, 159, 64, 1)',
                                                        'rgba(255,99,132,1)',
                                                        'rgba(54, 162, 235, 1)',
                                                        'rgba(255, 206, 86, 1)',
                                                        'rgba(75, 192, 192, 1)',
                                                        'rgba(153, 102, 255, 1)',
                                                        'rgba(255, 159, 64, 1)',
                                                        'rgba(255,99,132,1)',
                                                        'rgba(54, 162, 235, 1)',
                                                        'rgba(255, 206, 86, 1)',
                                                        'rgba(75, 192, 192, 1)',
                                                        'rgba(153, 102, 255, 1)',
                                                        'rgba(255, 159, 64, 1)'
                                                ],
                                                borderWidth: 1
                                        }]
                                },
                                options: {
                                animation: {
                                duration: 8000
                                }
                                }
                        });
                    </script>
                </li>
            </div>

            <div class="col-md-12">
                <h2>★あなたと仲の良いユーザーランキング★</h2>
                <Div Align="center">
                    <% for (int i = 0; i < 5; i++) {%>
                    <font size=<%=7 - i%> color="#99ff00">
                    <%=i + 1%>位：
                    <img src=<%=model.pics[i]%> />
                    <%=model.ranking[i] + "      "%>
                    Score：<%=model.ranknum[i]%><br></font>
                    <% }
                        model.kaiseki(model.text);%>
                </div>
            </div>

            <br><br>
            <div class="col-md-12">
                <h2>★あなたのツイートステータス★</h2>
                <div class="col-sm-3 col-xs-6">
                    <h4>1日のツイート回数</h4>
                    <%=model.getTwipday()%>
                    回
                </div>
                <div class="col-sm-3 col-xs-6">
                    <h4>最も活発な時間</h4>
                    XX							
                    時
                </div>
                <div class="col-sm-3 col-xs-6">
                    <h4>ひとりごと率</h4>
                    XX							
                    %
                </div>
                <div class="col-sm-3 col-xs-6">
                    <h4>Twitter 歴</h4>
                    XX							
                    日
                </div>
                <div class="col-sm-3 col-xs-6">
                    <h4>平均文字数</h4>
                    <%=model.getTwimean()%>
                    回
                </div>
                <div class="col-sm-3 col-xs-6">
                    <h4>1日平均文字数</h4>
                    XX							
                    時
                </div>
                <div class="col-sm-3 col-xs-6">
                    <h4>累計文字数</h4>
                    XX							
                    %
                </div>
                <div class="col-sm-3 col-xs-6">
                    <h4>平均ツイート間隔</h4>
                    XX							
                    日
                </div>
            </div>
            <br><br>
            <div class="col-md-12">
                <h2>★あなたのぼっち度★</h2>
                <p><font size="5"><%=model.getBotti()%>%</font></p><br>
                <canvas id="Botti" height="500" width="1000"></canvas><br>
                <script>
                    var ctx2 = document.getElementById("Botti");
                    var botti = new Chart(ctx2, {
                    type: 'pie',
                            data: {
                            labels: [
                                    "ひとりごと",
                                    "リプライ"
                            ], //x軸のラベル
                                    datasets: [
                                    {
                                    data: [<%=model.getBotti()%>, 100 -<%=model.getBotti()%>],
                                            backgroundColor: [
                                                    "#36A2EB",
                                                    "#FF6384"
                                            ],
                                            borderColor: [
                                                    "#36A2EB",
                                                    "#FF6384"
                                            ]
                                    }]
                            },
                            options: {
                            animation: {
                            duration: 4000
                            }
                            }
                    });
                </script>
            </div>
            <br><br>

            <br><br>
            <div class="col-md-12">
                <h2>★フォロー状況★</h2>
                <canvas id="Follow" height="500" width="1000"></canvas><br>
                <script>
                    var ctx3 = document.getElementById("Follow");
                    var follow = new Chart(ctx3, {
                    type: 'pie',
                            data: {
                            labels: [
                                    "片思い",
                                    "片思われ",
                                    "両思い"
                            ], //x軸のラベル
                                    datasets: [
                                    {
                                    data: [15, 8, 77],
                                            backgroundColor: [
                                                    "#FFCE56",
                                                    "#ccffcc",
                                                    "#ffb3da"
                                            ],
                                            borderColor: [
                                                    "#FFCE56",
                                                    "#ccffcc",
                                                    "#ffb3da"
                                            ]
                                    }]
                            },
                            options: {
                            animation: {
                            duration: 12000
                            }
                            }
                    });
                </script>
            </div>
            <br><br>
            <div class="col-md-12">
                <script>
                    var fill = d3.scale.category20();
                    var words = [
                    <% for (int i = 0; i < model.words.size(); i++) {%>
                    {"text":"<%=model.getWords(i)%>", "size": <%=model.wnum.get(i)%>},
                    <%}%>
                    {"text":"うめつい", "size":1}
                    ];
                    var countMax = d3.max(words, function(d){return d.size});
                    var sizeScale = d3.scale.linear().domain([0, countMax]).range([10, 100]);
                    var colorScale = d3.scale.category20();
                    words = words.map(function(d){
                    return {
                    text:d.text,
                            size:sizeScale(d.size)
                    };
                    });
                    var layout = d3.layout.cloud()
                            .size([800, 500])
                            .words(words)
                            .rotate(function () {
                            return ~~(Math.random() * 2) * 90;
                            })
                            .font("Impact")
                            .fontSize(function (d) {
                            return d.size;
                            })
                            .on("end", draw);
                    layout.start();
                    function draw(words) {
                    d3.select("body").select("#test")
                            .attr("width", layout.size()[0])
                            .attr("height", layout.size()[1])
                            .append("g")
                            .attr("transform", "translate(400,250)")
                            .selectAll("text")
                            .data(words)
                            .enter().append("text")
                            .style("font-size", function (d) {
                            return d.size + "px";
                            })
                            .style("font-family", "Impact")
                            .style("fill", function (d, i) {
                            return fill(i);
                            })
                            .attr("text-anchor", "middle")
                            .attr("transform", function (d) {
                            return "translate(" + [d.x, d.y] + ")rotate(" + d.rotate + ")";
                            })
                            .text(function (d) {
                            return d.text;
                            });
                    }
                    document.getElementsByTagName('svg')
                </script>
            </div>
        </div>
        <script type="text/javascript">

                    var obj = {
                    //基本情報が設定できます
                    "base": {
                    color: "white", //文字の色を指定します
                            speed: "normal", //文字が流れるスピードを指定します。slow/fast/normal 
                            interval: "normal", //文字が流れる間隔を指定します。slow/fast/normal
                            font_size: "30px", //フォントのサイズを指定します。
                            loop: true //文字が最後まで流れた後に、繰り返すかどうか　true/false

                    },
                            //ここに、重ねるコメントを登録します。個数制限はありません。
                            "comments": [
            <% int comments = 200;
                if (model.words.size() < comments) {
                    comments = model.words.size() - 1;
                }
            %>
            <% for (int i = 0; i < comments; i++) {%>
                            "<%=model.getWords(i)%>",
            <%}%>
                            "うめつい"



                            ]

                    };
            nicoscreen.set(obj);
            nicoscreen.start();
            var box = document.getElementById('nicoscreen');
            box.style.border = 'white';

        </script>
        <% }%>
    </body>
</html>
