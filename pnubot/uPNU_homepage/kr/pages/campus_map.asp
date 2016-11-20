<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml" xml:lang="ko" lang="ko">
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <meta http-equiv="X-Ua-Compatible" content="IE=edge" />
    <title>Campus Map</title>

    <link href="../../../uPNU_common/css/base.css" rel="stylesheet" type="text/css" />
    <link href="../../../uPNU_common/css/skip.css" rel="stylesheet" type="text/css" />
    <link href="../css/sub/sub_content.css" rel="stylesheet" type="text/css" />
    <link href="../css/sub/sub_layout.css" rel="stylesheet" type="text/css" />
    <script type="text/javascript" src="../../../uPNU_common/js/jquery/jquery-1.9.1.js"></script>
    <script type="text/javascript" src="../js/structure.js"></script>
    <script type="text/javascript">

        Map = function () {
            this.map = new Object();
        }
        Map.prototype = {
            put: function (key, value) {
                this.map[key] = value;
            },
            get: function (key) {
                return this.map[key];
            },
            containsKey: function (key) {
                return key in this.map;
            },
            containsValue: function (value) {
                for (var prop in this.map) {
                    if (this.map[prop] == value) return true;
                }
                return false;
            },
            isEmpty: function (key) {
                return (this.size() == 0);
            },
            clear: function () {
                for (var prop in this.map) {
                    delete this.map[prop];
                }
            },
            remove: function (key) {
                delete this.map[key];
            },
            keys: function () {
                var keys = new Array();
                for (var prop in this.map) {
                    keys.push(prop);
                }
                return keys;
            },
            values: function () {
                var values = new Array();
                for (var prop in this.map) {
                    values.push(this.map[prop]);
                }
                return values;
            },
            size: function () {
                var count = 0;
                for (var prop in this.map) {
                    count++;
                }
                return count;
            }
        };

        var map = new Map();
        map.put('001', new Object({ 'x': '285', 'y': '540' })); //ATM1
        map.put('002', new Object({ 'x': '350', 'y': '310' })); //ATM2
        map.put('003', new Object({ 'x': '540', 'y': '350' })); //ATM3
        map.put('004', new Object({ 'x': '170', 'y': '265' })); //ATM4
        map.put('005', new Object({ 'x': '335', 'y': '160' })); //ATM5
        map.put('006', new Object({ 'x': '527', 'y': '150' })); //ATM6
       
		map.put('011', new Object({ 'x': '328', 'y': '462' })); //우체국

        map.put('021', new Object({ 'x': '335', 'y': '160' })); //편의점 중도
        map.put('022', new Object({ 'x': '467', 'y': '425' })); //편의점 기계기술연구동

        map.put('031', new Object({ 'x': '475', 'y': '246' })); //카페1
        map.put('032', new Object({ 'x': '390', 'y': '410' })); //카페2
        map.put('033', new Object({ 'x': '335', 'y': '160' })); //카페3

        map.put('041', new Object({ 'x': '200', 'y': '305' })); //농협은행

        $(function () {
            var urlValue = window.location.href;

            $('.arrow_list li').mouseover(function () {
                if ($(this).parents('.campus_map').attr('id') == 'armi') {
                    return;
                } else {
                    var target_x = map.get($(this).children('.bld_num').text()).x;
                    var target_y = map.get($(this).children('.bld_num').text()).y;
                    var target_t = $(this).children('a').text();

                    $('.pointer').css({ 'top': parseInt(target_y, 10), 'left': parseInt(target_x, 10) });
                    $('.pointer span').text(target_t);
                    $('.pointer').show();
                }
            });

            $('.arrow_list li').mouseout(function () {
                $('.pointer').hide();
            });

            $('.arrow_list li').click(function () {
                $('.cont_img img').attr('src', '/uPNU_homepage/kr/pages/img/campus_map_001.gif');
                $('.cont_img img').attr('src', '/uPNU_homepage/kr/pages/img/campus_map_img/mapimg_' + $(this).children('.bld_num').text() + '.jpg');
                $('.cont_img img').attr('alt', $(this).children('a').text());
                $('.cont_txt').text(eval('text' + $(this).children('.bld_num').text()));

                $('div.pointer>span').text($(this).children('a').text());
                $('div.cont_img>p.name>span.b_bld_num').text($(this).children('.bld_num').text());
                $('div.cont_img>p.name>span.b_bld_name').text($(this).children('a').text());

                $('.pointer').css({ 'top': parseInt(map.get($(this).children('.bld_num').text()).y, 10), 'left': parseInt(map.get($(this).children('.bld_num').text()).x, 10) });
                $('.pointer span').text($(this).children('a').text());
                $('.pointer').show();
            });

            $('.arrow_list li a').keyup(function (e) {
                if (e.keyCode == 13) {
                    $('.cont_img img').attr('src', '/uPNU_homepage/kr/pages/img/campus_map_001.gif');
                    $('.cont_img img').attr('src', '/uPNU_homepage/kr/pages/img/campus_map_img/mapimg_' + $(this).next('.bld_num').text() + '.jpg');
                    $('.cont_img img').attr('alt', $(this).children('a').text());
                    $('.cont_txt').text(eval('text' + $(this).parent().children('.bld_num').text()));

                    $('.pointer').css({ 'top': parseInt(target_y, 10), 'left': parseInt(target_x, 10) });
                    $('.pointer span').text(target_t);
                    $('.pointer').show();
                }
            });
        });

        function void_printstart() {
            var win = window.open();
            self.focus();

            win.document.open();
            win.document.write('<' + 'html' + '><' + 'head' + '><' + 'style' + '>');
            win.document.write('body, td { font-family: Verdana; font-size: 10pt;}');
            win.document.write('<' + '/' + 'style' + '><' + '/' + 'head' + '><' + 'body' + '>');
            win.document.write(document.getElementById("print_div").innerHTML);
            win.document.write('<' + '/' + 'body' + '><' + '/' + 'html' + '>');
            win.document.close();
            win.print();

            win.close();
        }
    </script>
</head>

<body>
	<div id="campus_map_wrap">
        <div class="logo"><img src="/uPNU_homepage/kr/pages/img/campus_map_logo.gif" alt="부산대학교" /></div>
        <!-- tab-->

        <!-- //tab-->
        <!-- 캠퍼스 맵 -->
        <!-- 부산 캠퍼스 맵 -->
        <div class="campus_map" id="busan">
            <div class="map_img" id="print_div">
                <!-- 건물명 -->
                <div class="pointer"><span>편의시설</span></div>
                <img src="/uPNU_homepage/kr/pages/img/campus_map_01.jpg" alt="부산캠퍼스 맵"  />
            </div>
            <div class="map_content">
				<!--
                <div class="map_cont_box">
                    <div class="map_cont">
                        <div class="cont_img">
                            <p class="img"><img src="/uPNU_homepage/kr/pages/img/campus_map_img/mapimg_001.jpg" alt="제3공학관(105)(기계관)앞" /></p>
                            <p class="name"><span class="b_bld_num num05">001</span><span class="b_bld_name">제3공학관(105)(기계관)앞</span></p>
                        </div>
                        <p class="cont_txt"></p>
                    </div>
                </div>
                -->
                <div class="map_list_wrap">
                    <p class="txt">클릭하시면 편의시설의 위치를 보실 수 있습니다.</p>
                    <div class="map_list ps_cp">
                        <div class="map_ap_list">
                            <span class="apb">ATM</span>
                            <ul class="arrow_list">
                                <li><a href="#" title="ATM">ATM 12공학관 우측</a><span class="bld_num num01">001</span>
                                </li>

                                <li><a href="#">ATM 조선해양공학관 아래측</a><span class="bld_num num01">002</span>

                                </li>

                                <li><a href="#">ATM 공동연구 기기동 우측</a><span class="bld_num num01">003</span>

                                </li>

                                <li><a href="#">ATM 유기소재관 아래측</a><span class="bld_num num01">004</span>

                                </li>

                                <li><a href="#">ATM 제1도서관 앞</a><span class="bld_num num01">005</span>

                                </li>
                               
                                <li><a href="#">ATM 경영관 앞</a><span class="bld_num num01">006</span>

                                </li>
                                
                            </ul>
                        </div>
						
                        <div class="map_ap_list">
                            <span class="apb">우체국</span>
                            <ul class="arrow_list">
                                <li><a href="#">우체국 문창회관앞</a><span class="bld_num num01">011</span>
                                </li>
                            </ul>

                        </div>
						<div class="map_ap_list">
                            <span class="apb">편의점</span>
                            <ul class="arrow_list">
                                <li><a href="#">편의점 중앙도서관</a><span class="bld_num num01">021</span>
                                </li>
								<li><a href="#">편의점 기계기술연구동</a><span class="bld_num num01">022</span>
                                </li>
                            </ul>

                        </div>
						<div class="map_ap_list">
                            <span class="apb">카페</span>
                            <ul class="arrow_list">
                                <li><a href="#">카페 생물관 아래측</a><span class="bld_num num01">031</span>
                                </li>
								<li><a href="#">카페 NC백화점</a><span class="bld_num num01">032</span>
                                </li>
								<li><a href="#">카페 중앙도서관</a><span class="bld_num num01">033</span>
                                </li>
                            </ul>

                        </div>
						<div class="map_ap_list">
                            <span class="apb">은행</span>
                            <ul class="arrow_list">
                                <li><a href="#">농협은행 부산점</a><span class="bld_num num01">041</span>
                                </li>
                            </ul>

                        </div>
                    </div>
                </div>
            </div>

        </div>
        
        <!-- //부산 캠퍼스 맵 -->

	</div>
</body>
</html>