﻿<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
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
        map.put('511', new Object({ 'x': '380', 'y': '150' })); //제3공학관(105)(기계관)앞
        map.put('401', new Object({ 'x': '150', 'y': '325' })); //대학본부(205)(본관)
        map.put('706', new Object({ 'x': '125', 'y': '50' })); //자연대 연구실험동(313)출입구
        map.put('705', new Object({ 'x': '60', 'y': '60' })); //제7공학관(406)(화공관)옆
        map.put('514', new Object({ 'x': '527', 'y': '150' })); //제1도서관(510)(연도)앞
        map.put('516', new Object({ 'x': '427', 'y': '130' })); //경제통상관
        map.put('109', new Object({ 'x': '445', 'y': '540' })); //경영관(514)(상대 A동)출입구
        map.put('312', new Object({ 'x': '485', 'y': '315' })); //공동실험실습관
        map.put('311', new Object({ 'x': '520', 'y': '350' })); //공동연구기기동
        map.put('607', new Object({ 'x': '385', 'y': '110' })); //공동연구소동
        map.put('709', new Object({ 'x': '338', 'y': '60' })); //과학기술연구동
        map.put('409', new Object({ 'x': '288', 'y': '286' })); //교수회관
        map.put('301', new Object({ 'x': '123', 'y': '465' })); //구조실험동
        map.put('210', new Object({ 'x': '652', 'y': '336' })); //국제언어교육원
        map.put('419', new Object({ 'x': '470', 'y': '213' })); //금정회관
        map.put('208', new Object({ 'x': '467', 'y': '425' })); //기계기술연구동
        map.put('203', new Object({ 'x': '328', 'y': '462' })); //문창회관(310)
        map.put('204', new Object({ 'x': '333', 'y': '469' })); //문창회관(310) 지하주차장
        map.put('710', new Object({ 'x': '228', 'y': '35' })); //대운동장
        map.put('205', new Object({ 'x': '390', 'y': '460' })); //대학본부
        map.put('310', new Object({ 'x': '450', 'y': '348' })); //문창회관
        map.put('703', new Object({ 'x': '162', 'y': '93' })); //미술관
        map.put('412', new Object({ 'x': '386', 'y': '270' })); //박물관 A
        map.put('413', new Object({ 'x': '360', 'y': '265' })); //박물관 B
        map.put('509', new Object({ 'x': '259', 'y': '216' })); //박물관 별관
        map.put('609', new Object({ 'x': '496', 'y': '83' })); //법학관
        map.put('211', new Object({ 'x': '705', 'y': '325' })); //보육종합센터
        map.put('421', new Object({ 'x': '547', 'y': '186' })); //사회관
        map.put('508', new Object({ 'x': '190', 'y': '176' })); //산학협동관
        map.put('209', new Object({ 'x': '673', 'y': '404' })); //상남국제회관
        map.put('415', new Object({ 'x': '360', 'y': '226' })); //샛벌회관
        map.put('416', new Object({ 'x': '475', 'y': '266' })); //생물관
        map.put('602', new Object({ 'x': '208', 'y': '147' })); //생활환경관
        map.put('603', new Object({ 'x': '205', 'y': '143' })); //생활환경대실험실습동
        map.put('407', new Object({ 'x': '200', 'y': '270' })); //선박예인수조연구동
        map.put('410', new Object({ 'x': '210', 'y': '265' })); //선박충격ㆍ피로ㆍ도장ㆍ시험연구동
        map.put('422', new Object({ 'x': '625', 'y': '194' })); //성학관
        map.put('505', new Object({ 'x': '155', 'y': '227' })); //실험동물센터
        map.put('111', new Object({ 'x': '450', 'y': '560' })); //실험폐기물처리장
        map.put('502', new Object({ 'x': '141', 'y': '247' })); //약학관(구관)
        map.put('503', new Object({ 'x': '140', 'y': '220' })); //약학관(신관)
        map.put('501', new Object({ 'x': '123', 'y': '235' })); //약학연구동
        map.put('110', new Object({ 'x': '483', 'y': '515' })); //에너지분야 실험실
        map.put('601', new Object({ 'x': '144', 'y': '174' })); //예술관
        map.put('318', new Object({ 'x': '687', 'y': '290' })); //외인교수 아파트
        map.put('202', new Object({ 'x': '225', 'y': '447' })); //운죽정(국제지원센터)
        map.put('712', new Object({ 'x': '395', 'y': '32' })); //웅비관 A동
        map.put('713', new Object({ 'x': '424', 'y': '8' })); //웅비관 B동
        map.put('707', new Object({ 'x': '242', 'y': '74' })); //음악관
        map.put('507', new Object({ 'x': '240', 'y': '235' })); //인덕관
        map.put('306', new Object({ 'x': '289', 'y': '367' })); //인문관
        map.put('307', new Object({ 'x': '289', 'y': '327' })); //인문대교수연구동
        map.put('411', new Object({ 'x': '380', 'y': '285' })); //자연과학관
        map.put('313', new Object({ 'x': '545', 'y': '330' })); //자연대 연구실험동
        map.put('315', new Object({ 'x': '595', 'y': '310' })); //자유관 A동
        map.put('316', new Object({ 'x': '620', 'y': '300' })); //자유관 B동
        map.put('317', new Object({ 'x': '635', 'y': '290' })); //자유관 관리동
        map.put('314', new Object({ 'x': '535', 'y': '305' })); //정보전산원 교육관
        map.put('402', new Object({ 'x': '130', 'y': '315' })); //정학관
        map.put('510', new Object({ 'x': '335', 'y': '160' })); //제1 도서관
        map.put('515', new Object({ 'x': '280', 'y': '190' })); //제1 도서관 및 정보전산원
        map.put('308', new Object({ 'x': '410', 'y': '320' })); //제1 물리관
        map.put('102', new Object({ 'x': '255', 'y': '570' })); //제1 부속공장
        map.put('417', new Object({ 'x': '415', 'y': '225' })); //제1 사범관
        map.put('418', new Object({ 'x': '425', 'y': '215' })); //제2 교수연구동
        map.put('420', new Object({ 'x': '545', 'y': '245' })); //제2 도서관
        map.put('309', new Object({ 'x': '405', 'y': '310' })); //제2 물리관
        map.put('608', new Object({ 'x': '425', 'y': '75' })); //제2 법학관
        map.put('701', new Object({ 'x': '30', 'y': '75' })); //제2 사범관
        map.put('303', new Object({ 'x': '150', 'y': '445' })); //제1 공학관
        map.put('405', new Object({ 'x': '200', 'y': '305' })); //제2 공학관(재료관)
        map.put('105', new Object({ 'x': '285', 'y': '550' })); //제3 공학관(기계관)
        map.put('305', new Object({ 'x': '145', 'y': '425' })); //제4 공학관
        map.put('408', new Object({ 'x': '170', 'y': '265' })); //제5 공학관(유기소재관)
        map.put('201', new Object({ 'x': '215', 'y': '475' })); //제6 공학관(컴퓨터공학관)
        map.put('406', new Object({ 'x': '190', 'y': '287' })); //제7 공학관(화공관)
        map.put('107', new Object({ 'x': '435', 'y': '505' })); //제8 공학관(항공관)
        map.put('108', new Object({ 'x': '468', 'y': '512' })); //제9 공학관(기전관)
        map.put('207', new Object({ 'x': '410', 'y': '420' })); //제10 공학관(특성화공학관)
        map.put('206', new Object({ 'x': '340', 'y': '415' })); //제11 공학관(조선해양공학관)
        map.put('103', new Object({ 'x': '275', 'y': '560' })); //제12 공학관
        map.put('702', new Object({ 'x': '195', 'y': '125' })); //조소실
        map.put('704', new Object({ 'x': '130', 'y': '115' })); //조형관
        map.put('414', new Object({ 'x': '348', 'y': '222' })); //지구관
        map.put('715', new Object({ 'x': '500', 'y': '20' })); //진리관 가동
        map.put('716', new Object({ 'x': '485', 'y': '10' })); //진리관 나동
        map.put('717', new Object({ 'x': '470', 'y': '0' })); //진리관 다동
        map.put('714', new Object({ 'x': '450', 'y': '45' })); //진리관 관리동
        map.put('513', new Object({ 'x': '410', 'y': '135' })); //철골주차장
        map.put('512', new Object({ 'x': '420', 'y': '170' })); //테니스장
        map.put('302', new Object({ 'x': '175', 'y': '475' })); //토조실험동
        map.put('319', new Object({ 'x': '140', 'y': '415' })); //통합기계관
        map.put('605', new Object({ 'x': '340', 'y': '140' })); //학군단
        map.put('708', new Object({ 'x': '310', 'y': '60' })); //학생회관
        map.put('606', new Object({ 'x': '335', 'y': '115' })); //화학관
        map.put('106', new Object({ 'x': '400', 'y': '510' })); //효원문화회관
        map.put('506', new Object({ 'x': '190', 'y': '210' })); //효원산학협동관
        map.put('711', new Object({ 'x': '350', 'y': '5' })); //효원재
        map.put('101', new Object({ 'x': '205', 'y': '580' })); //MEMS / NANO 클린룸동
        map.put('403', new Object({ 'x': '170', 'y': '315' })); //10. 16 기념관


        map.put('Y01', new Object({ 'x': '355', 'y': '50' })); //의학전문대학원
        map.put('Y02', new Object({ 'x': '250', 'y': '135' })); //치의학전문대학병원
        map.put('Y03', new Object({ 'x': '3522', 'y': '180' })); //한의학전문대학원
        map.put('Y04', new Object({ 'x': '380', 'y': '140' })); //간호대학
        map.put('Y05', new Object({ 'x': '40', 'y': '260' })); //행림관
        map.put('Y06', new Object({ 'x': '100', 'y': '190' })); //지진방재연구센터
        map.put('Y07', new Object({ 'x': '280', 'y': '0' })); //파워플랜트
        map.put('Y08', new Object({ 'x': '290', 'y': '120' })); //쓰레기집하장
        map.put('Y09', new Object({ 'x': '465', 'y': '115' })); //편의동
        map.put('Y10', new Object({ 'x': '410', 'y': '115' })); //의생명과학도서관
        map.put('Y11', new Object({ 'x': '95', 'y': '235' })); //충격공학연구센터시험연구동
        map.put('Y12', new Object({ 'x': '180', 'y': '160' })); //운동장
        map.put('Y13', new Object({ 'x': '200', 'y': '115' })); //테니스장
        map.put('YH01', new Object({ 'x': '560', 'y': '180' })); //양산부산대학교병원
        map.put('YH02', new Object({ 'x': '655', 'y': '225' })); //어린이병원
        map.put('YH03', new Object({ 'x': '480', 'y': '310' })); //치과병원
        map.put('YH04', new Object({ 'x': '425', 'y': '265' })); //한방병원
        map.put('YH05', new Object({ 'x': '470', 'y': '240' })); //재활병원
        map.put('YH06', new Object({ 'x': '470', 'y': '200' })); //전문질환센터
        map.put('YH07', new Object({ 'x': '370', 'y': '335' })); //한의약임상연구센터
        map.put('YH08', new Object({ 'x': '730', 'y': '230' })); //NH아리관
        map.put('YH09', new Object({ 'x': '490', 'y': '210' })); //교수연구동·행정동


        map.put('M01', new Object({ 'x': '310', 'y': '280' })); //행정지원본부동, 나노생명과학도서관
        map.put('M02', new Object({ 'x': '530', 'y': '250' })); //나노과학기술관
        map.put('M03', new Object({ 'x': '235', 'y': '260' })); //생명자원과학관
        map.put('M04', new Object({ 'x': '440', 'y': '230' })); //학생회관
        map.put('M05', new Object({ 'x': '20', 'y': '150' })); //비마관 및 매화관, 청학관
        map.put('M06', new Object({ 'x': '200', 'y': '230' })); //부속공장
        map.put('M07', new Object({ 'x': '250', 'y': '380' })); //정문수위실
        map.put('M08', new Object({ 'x': '30', 'y': '260' })); //운동장
        map.put('M09', new Object({ 'x': '690', 'y': '300' })); //공동실험실습관
        map.put('M10', new Object({ 'x': '745', 'y': '360' })); //테니스장
        map.put('M11', new Object({ 'x': '500', 'y': '165' })); //첨단온실

        $(function () {
            var urlValue = window.location.href;
            if (urlValue.indexOf('?') > -1) {
                changeCampus(urlValue.substr(urlValue.indexOf('=') + 1).replace("#",""));
            } else {
                changeCampus('B');
            }

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
                $('.cont_img img').attr('src', '/uPNU_homepage/kr/pages/img/campus_map_511.gif');
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
                    $('.cont_img img').attr('src', '/uPNU_homepage/kr/pages/img/campus_map_511.gif');
                    $('.cont_img img').attr('src', '/uPNU_homepage/kr/pages/img/campus_map_img/mapimg_' + $(this).next('.bld_num').text() + '.jpg');
                    $('.cont_img img').attr('alt', $(this).children('a').text());
                    $('.cont_txt').text(eval('text' + $(this).parent().children('.bld_num').text()));

                    $('.pointer').css({ 'top': parseInt(target_y, 10), 'left': parseInt(target_x, 10) });
                    $('.pointer span').text(target_t);
                    $('.pointer').show();
                }
            });
        });

        function changeCampus(strCampus) {
            if (strCampus == 'B') {
                document.getElementById('busan').style.display = "block";
                document.getElementById('yangsan').style.display = "none";
                document.getElementById('miryang').style.display = "none";
                document.getElementById('armi').style.display = "none";

                $('.cm_tab li a')[0].className = "on"
                $('.cm_tab li a')[1].className = ""
                $('.cm_tab li a')[2].className = ""
                $('.cm_tab li a')[3].className = ""

                $('.pointer').css({ 'top': parseInt('150', 10), 'left': parseInt('380', 10) });
                $('.pointer span').text('제3공학관(105)(기계관)앞');

                $('div.cont_img>p.name>span.b_bld_num').text('511');
                $('div.cont_img>p.name>span.b_bld_name').text('제3공학관(105)(기계관)앞');

                $('.cont_img img').attr('src', '/uPNU_homepage/kr/pages/img/campus_map_img/mapimg_511.jpg');
                $('.cont_txt').text(eval('text511'));
                $('.pointer').show();

            } else if (strCampus == 'Y') {
                document.getElementById('busan').style.display = "none";
                document.getElementById('yangsan').style.display = "block";
                document.getElementById('miryang').style.display = "none";
                document.getElementById('armi').style.display = "none";

                $('.cm_tab li a')[0].className = ""
                $('.cm_tab li a')[1].className = "on"
                $('.cm_tab li a')[2].className = ""
                $('.cm_tab li a')[3].className = ""

                $('.pointer').css({ 'top': 50, 'left': 355 });
                $('.pointer span').text("의학전문대학원");

                $('div.cont_img>p.name>span.b_bld_num').text('Y01');
                $('div.cont_img>p.name>span.b_bld_name').text('의학전문대학원');

                $('.cont_img img').attr('src', '/uPNU_homepage/kr/pages/img/campus_map_img/mapimg_Y01.jpg');
                $('.cont_txt').text(eval('textY01'));
                $('.pointer').show();

            } else if (strCampus == 'M') {
                document.getElementById('busan').style.display = "none";
                document.getElementById('yangsan').style.display = "none";
                document.getElementById('miryang').style.display = "block";
                document.getElementById('armi').style.display = "none";

                $('.cm_tab li a')[0].className = ""
                $('.cm_tab li a')[1].className = ""
                $('.cm_tab li a')[2].className = "on"
                $('.cm_tab li a')[3].className = ""

                $('.pointer').css({ 'top': 280, 'left': 310 });
                $('.pointer span').text("행정지원본부동, 나노생명과학도서관");

                $('div.cont_img>p.name>span.b_bld_num').text('M01');
                $('div.cont_img>p.name>span.b_bld_name').text('행정지원본부동, 나노생명과학도서관');

                $('.cont_img img').attr('src', '/uPNU_homepage/kr/pages/img/campus_map_img/mapimg_M01.jpg');
                $('.cont_txt').text(eval('textM01'));
                $('.pointer').show();

            } else if (strCampus == 'A') {
                document.getElementById('busan').style.display = "none";
                document.getElementById('yangsan').style.display = "none";
                document.getElementById('miryang').style.display = "none";
                document.getElementById('armi').style.display = "block";

                $('.cm_tab li a')[0].className = ""
                $('.cm_tab li a')[1].className = ""
                $('.cm_tab li a')[2].className = ""
                $('.cm_tab li a')[3].className = "on"
                
                $('.pointer').css('display', 'none');
                $('.pointer span').text('');


                $('div.cont_img>p.name>span.b_bld_num').text('');
                $('div.cont_img>p.name>span.b_bld_name').text('');

                $('.cont_txt').text('');
            }
        }
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
        <ul class="cm_tab">
            <li><a href="javascript:changeCampus('B')" class="on">부산캠퍼스</a></li>
            <li><a href="javascript:changeCampus('Y')"></a></li>
            <li><a href="javascript:changeCampus('M')"></a></li>
            <li><a href="javascript:changeCampus('A')"></a></li>
        </ul>
        <!-- //tab-->
        <!-- 캠퍼스 맵 -->
        <!-- 부산 캠퍼스 맵 -->
        <div class="campus_map" id="busan">
            <div class="map_img" id="print_div">
                <div class="map_title"><img src="/uPNU_homepage/kr/pages/img/sub_01_07_03_title01.png" alt="BUSAN CAMPUS 부산캠퍼스" /></div>
                <!-- 건물명 -->
                <div class="pointer"><span>제3공학관(105)(기계관)앞</span></div>
                <img src="/uPNU_homepage/kr/pages/img/campus_map_01.jpg" alt="부산캠퍼스 맵"  />
            </div>
            <div class="map_content">
				<!--
                <div class="map_cont_box">
                    <div class="map_cont">
                        <div class="cont_img">
                            <p class="img"><img src="/uPNU_homepage/kr/pages/img/campus_map_img/mapimg_511.jpg" alt="제3공학관(105)(기계관)앞" /></p>
                            <p class="name"><span class="b_bld_num num05">511</span><span class="b_bld_name">제3공학관(105)(기계관)앞</span></p>
                        </div>
                        <p class="cont_txt"></p>
                    </div>
                </div>
                -->
                <div class="map_list_wrap">
                    <p class="txt">클릭하시면 위치와 상세내용을 보실 수 있습니다.</p>
                    <div class="map_list ps_cp">
                        <div class="map_ap_list">
                            <span class="apb">ATM</span>
                            <ul class="arrow_list">
                                <li><a href="#" title="제3공학관(105)(기계관)앞">제3공학관(105)(기계관)앞</a><span class="bld_num num05">511</span>
									<div class="map_cont_box" tabindex="0">
										<div class="map_cont">
											<div class="cont_img">
												<p class="img"><img src="/uPNU_homepage/kr/pages/img/campus_map_img/mapimg_511.jpg" alt="제3공학관(105)(기계관)앞" /></p>
												<p class="name"><span class="b_bld_num num05">511</span><span class="b_bld_name">제3공학관(105)(기계관)앞</span></p>
											</div>
											<p class="cont_txt"></p>
										</div>
									</div>
                                </li>
                                <li><a href="#">대학본부(205)(본관)</a><span class="bld_num num04">401</span>
									<div class="map_cont_box" tabindex="0">
										<div class="map_cont">
											<div class="cont_img">
												<p class="img"><img src="/uPNU_homepage/kr/pages/img/campus_map_img/mapimg_401.jpg" alt="대학본부(205)(본관)" /></p>
												<p class="name"><span class="b_bld_num num05">401</span><span class="b_bld_name">대학본부(205)(본관)</span></p>
											</div>
											<p class="cont_txt"></p>
										</div>
									</div>
                                </li>
                                <li><a href="#">자연대 연구실험동(313)출입구</a><span class="bld_num num07">706</span>
									<div class="map_cont_box" tabindex="0">
										<div class="map_cont">
											<div class="cont_img">
												<p class="img"><img src="/uPNU_homepage/kr/pages/img/campus_map_img/mapimg_706.jpg" alt="자연대 연구실험동(313)출입구" /></p>
												<p class="name"><span class="b_bld_num num05">706</span><span class="b_bld_name">자연대 연구실험동(313)출입구</span></p>
											</div>
											<p class="cont_txt"></p>
										</div>
									</div>
                                </li>
                                <li><a href="#">자연대 연구실험동(313)출입구 교수연구동</a><span class="bld_num num07">705</span>
									<div class="map_cont_box" tabindex="0">
										<div class="map_cont">
											<div class="cont_img">
												<p class="img"><img src="/uPNU_homepage/kr/pages/img/campus_map_img/mapimg_705.jpg" alt="자연대 연구실험동(313)출입구 교수연구동" /></p>
												<p class="name"><span class="b_bld_num num05">705</span><span class="b_bld_name">자연대 연구실험동(313)출입구 교수연구동</span></p>
											</div>
											<p class="cont_txt"></p>
										</div>
									</div>
                                </li>
                                <li><a href="#">제1도서관(510)(연도)앞</a><span class="bld_num num05">514</span>
									<div class="map_cont_box" tabindex="0">
										<div class="map_cont">
											<div class="cont_img">
												<p class="img"><img src="/uPNU_homepage/kr/pages/img/campus_map_img/mapimg_514.jpg" alt="제1도서관(510)(연도)앞" /></p>
												<p class="name"><span class="b_bld_num num05">514</span><span class="b_bld_name">제1도서관(510)(연도)앞</span></p>
											</div>
											<p class="cont_txt"></p>
										</div>
									</div>
                                </li>
                               
                                <li><a href="#">경영관(514)(상대 A동)출입구</a><span class="bld_num num01">109</span>
									<div class="map_cont_box" tabindex="0">
										<div class="map_cont">
											<div class="cont_img">
												<p class="img"><img src="/uPNU_homepage/kr/pages/img/campus_map_img/mapimg_109.jpg" alt="공동실험관" /></p>
												<p class="name"><span class="b_bld_num num05">109</span><span class="b_bld_name">공동실험관</span></p>
											</div>
											<p class="cont_txt"></p>
										</div>
									</div>
                                </li>
                                
                            </ul>
                        </div>

                        <div class="map_ap_list">
                            <span class="apb">우체국</span>
                            <ul class="arrow_list">
                                <li><a href="#">문창회관(310)</a><span class="bld_num num02">203</span>
									<div class="map_cont_box" tabindex="0">
										<div class="map_cont">
											<div class="cont_img">
												<p class="img"><img src="/uPNU_homepage/kr/pages/img/campus_map_img/mapimg_203.jpg" alt="문창회관(310)<" /></p>
												<p class="name"><span class="b_bld_num num05">203</span><span class="b_bld_name">문창회관(310)<</span></p>
											</div>
											<p class="cont_txt"></p>
										</div>
									</div>
                                </li>
                                
                            </ul>
                        </div>
                    </div>
                </div>
            </div>

        </div>
        
        <!-- //부산 캠퍼스 맵 -->

        <!-- 양산 캠퍼스 맵 -->
        <div class="campus_map" id="yangsan">
            <div class="map_img">
                <div class="map_title"><img src="/uPNU_homepage/kr/pages/img/sub_01_07_03_title02.png" alt="YANGSAN CAMPUS 양산캠퍼스" /></div>
                <!-- 건물명 -->
                <div class="pointer"><span>의학전문대학원</span></div>
                <img src="/uPNU_homepage/kr/pages/img/campus_map_02.jpg" alt="양산캠퍼스 맵"  />
            </div>
            <div class="map_content">
				<!--
                <div class="map_cont_box">
                    <div class="map_cont">
                        <div class="cont_img">
                            <p class="img"><img src="/uPNU_homepage/kr/pages/img/campus_map_0101.gif" alt="제3공학관(105)(기계관)앞" /></p>
                            <p class="name"><span class="b_bld_num">Y01</span><span class="b_bld_name">의학전문대학원</span></p>
                        </div>
                        <p class="cont_txt">2006년 전문대학원으로 전환했으며 2009년 양산캠퍼스 준공과 함께 이전했습니다. 8층 규모로 연면적은 17,674m²입니다.</p>
                    </div>
                </div>
                -->
                <div class="map_list_wrap">
                    <p class="txt">건물명을 클릭하시면 건물의 위치와 상세내용을 보실 수 있습니다.</p>
                    <div class="map_list">
                        <div class="map_ap_list">
                            <span class="ys_stitle">대학단지</span>
                            <ul class="arrow_list">
                                <li><a href="#">의학전문대학원</a><span class="bld_num">Y01</span>
									<div class="map_cont_box" tabindex="0">
										<div class="map_cont">
											<div class="cont_img">
												<p class="img"><img src="/uPNU_homepage/kr/pages/img/campus_map_img/mapimg_Y01.jpg" alt="의학전문대학원" /></p>
												<p class="name"><span class="b_bld_num">Y01</span><span class="b_bld_name">의학전문대학원</span></p>
											</div>
											<p class="cont_txt"></p>
										</div>
									</div>
                                </li>
                                <li><a href="#">치의학전문대학원</a><span class="bld_num">Y02</span>
									<div class="map_cont_box" tabindex="0">
										<div class="map_cont">
											<div class="cont_img">
												<p class="img"><img src="/uPNU_homepage/kr/pages/img/campus_map_img/mapimg_Y02.jpg" alt="치의학전문대학원" /></p>
												<p class="name"><span class="b_bld_num">Y02</span><span class="b_bld_name">치의학전문대학원</span></p>
											</div>
											<p class="cont_txt"></p>
										</div>
									</div>
                                </li>
                                <li><a href="#">한의학전문대학원</a><span class="bld_num">Y03</span>
									<div class="map_cont_box" tabindex="0">
										<div class="map_cont">
											<div class="cont_img">
												<p class="img"><img src="/uPNU_homepage/kr/pages/img/campus_map_img/mapimg_Y03.jpg" alt="한의학전문대학원" /></p>
												<p class="name"><span class="b_bld_num">Y03</span><span class="b_bld_name">한의학전문대학원</span></p>
											</div>
											<p class="cont_txt"></p>
										</div>
									</div>
                                </li>
                                <li><a href="#">간호대학</a><span class="bld_num">Y04</span>
									<div class="map_cont_box" tabindex="0">
										<div class="map_cont">
											<div class="cont_img">
												<p class="img"><img src="/uPNU_homepage/kr/pages/img/campus_map_img/mapimg_Y04.jpg" alt="간호대학" /></p>
												<p class="name"><span class="b_bld_num">Y04</span><span class="b_bld_name">간호대학</span></p>
											</div>
											<p class="cont_txt"></p>
										</div>
									</div>
                                </li>
                                <li><a href="#">행림관</a><span class="bld_num">Y05</span>
									<div class="map_cont_box" tabindex="0">
										<div class="map_cont">
											<div class="cont_img">
												<p class="img"><img src="/uPNU_homepage/kr/pages/img/campus_map_img/mapimg_Y05.jpg" alt="행림관" /></p>
												<p class="name"><span class="b_bld_num">Y05</span><span class="b_bld_name">행림관</span></p>
											</div>
											<p class="cont_txt"></p>
										</div>
									</div>
                                </li>
                                <li><a href="#">지진방재연구센터</a><span class="bld_num">Y06</span>
									<div class="map_cont_box" tabindex="0">
										<div class="map_cont">
											<div class="cont_img">
												<p class="img"><img src="/uPNU_homepage/kr/pages/img/campus_map_img/mapimg_Y06.jpg" alt="지진방재연구센터" /></p>
												<p class="name"><span class="b_bld_num">Y06</span><span class="b_bld_name">지진방재연구센터</span></p>
											</div>
											<p class="cont_txt"></p>
										</div>
									</div>
                                </li>
                                <li><a href="#">파워플랜트</a><span class="bld_num">Y07</span>
									<div class="map_cont_box" tabindex="0">
										<div class="map_cont">
											<div class="cont_img">
												<p class="img"><img src="/uPNU_homepage/kr/pages/img/campus_map_img/mapimg_Y07.jpg" alt="파워플랜트" /></p>
												<p class="name"><span class="b_bld_num">Y07</span><span class="b_bld_name">파워플랜트</span></p>
											</div>
											<p class="cont_txt"></p>
										</div>
									</div>
                                </li>
                                <li><a href="#">쓰레기집하장</a><span class="bld_num">Y08</span>
									<div class="map_cont_box" tabindex="0">
										<div class="map_cont">
											<div class="cont_img">
												<p class="img"><img src="/uPNU_homepage/kr/pages/img/campus_map_img/mapimg_Y08.jpg" alt="쓰레기집하장" /></p>
												<p class="name"><span class="b_bld_num">Y08</span><span class="b_bld_name">쓰레기집하장</span></p>
											</div>
											<p class="cont_txt"></p>
										</div>
									</div>
                                </li>
                                <li><a href="#">편의동</a><span class="bld_num">Y09</span>
									<div class="map_cont_box" tabindex="0">
										<div class="map_cont">
											<div class="cont_img">
												<p class="img"><img src="/uPNU_homepage/kr/pages/img/campus_map_img/mapimg_Y09.jpg" alt="편의동" /></p>
												<p class="name"><span class="b_bld_num">Y09</span><span class="b_bld_name">편의동</span></p>
											</div>
											<p class="cont_txt"></p>
										</div>
									</div>
                                </li>
                                <li><a href="#">의생명과학도서관</a><span class="bld_num">Y10</span>
									<div class="map_cont_box" tabindex="0">
										<div class="map_cont">
											<div class="cont_img">
												<p class="img"><img src="/uPNU_homepage/kr/pages/img/campus_map_img/mapimg_Y10.jpg" alt="의생명과학도서관" /></p>
												<p class="name"><span class="b_bld_num">Y10</span><span class="b_bld_name">의생명과학도서관</span></p>
											</div>
											<p class="cont_txt"></p>
										</div>
									</div>
                                </li>
                                <li><a href="#">충격공학연구센터 시험연구동</a><span class="bld_num">Y11</span>
									<div class="map_cont_box" tabindex="0">
										<div class="map_cont">
											<div class="cont_img">
												<p class="img"><img src="/uPNU_homepage/kr/pages/img/campus_map_img/mapimg_Y11.jpg" alt="충격공학연구센터 시험연구동" /></p>
												<p class="name"><span class="b_bld_num">Y11</span><span class="b_bld_name">충격공학연구센터 시험연구동</span></p>
											</div>
											<p class="cont_txt"></p>
										</div>
									</div>
                                </li>
                                <li><a href="#">운동장</a><span class="bld_num">Y12</span>
									<div class="map_cont_box" tabindex="0">
										<div class="map_cont">
											<div class="cont_img">
												<p class="img"><img src="/uPNU_homepage/kr/pages/img/campus_map_img/mapimg_Y12.jpg" alt="운동장" /></p>
												<p class="name"><span class="b_bld_num">Y12</span><span class="b_bld_name">운동장</span></p>
											</div>
											<p class="cont_txt"></p>
										</div>
									</div>
                                </li>
                                <li><a href="#">테니스장</a><span class="bld_num">Y13</span>
									<div class="map_cont_box" tabindex="0">
										<div class="map_cont">
											<div class="cont_img">
												<p class="img"><img src="/uPNU_homepage/kr/pages/img/campus_map_img/mapimg_Y13.jpg" alt="테니스장" /></p>
												<p class="name"><span class="b_bld_num">Y13</span><span class="b_bld_name">테니스장</span></p>
											</div>
											<p class="cont_txt"></p>
										</div>
									</div>
                                </li>
                            </ul>
                        </div>
                        <div class="map_ap_list">
                            <span class="ys_stitle">병원단지</span>
                            <ul class="arrow_list">
                                <li><a href="#">양산부산대학교 병원</a><span class="bld_num">YH01</span>
									<div class="map_cont_box" tabindex="0">
										<div class="map_cont">
											<div class="cont_img">
												<p class="img"><img src="/uPNU_homepage/kr/pages/img/campus_map_img/mapimg_YH01.jpg" alt="양산부산대학교 병원" /></p>
												<p class="name"><span class="b_bld_num">YH01</span><span class="b_bld_name">양산부산대학교 병원</span></p>
											</div>
											<p class="cont_txt"></p>
										</div>
									</div>
                                </li>
                                <li><a href="#">어린이병원</a><span class="bld_num">YH02</span>
									<div class="map_cont_box" tabindex="0">
										<div class="map_cont">
											<div class="cont_img">
												<p class="img"><img src="/uPNU_homepage/kr/pages/img/campus_map_img/mapimg_YH02.jpg" alt="어린이병원" /></p>
												<p class="name"><span class="b_bld_num">YH02</span><span class="b_bld_name">어린이병원</span></p>
											</div>
											<p class="cont_txt"></p>
										</div>
									</div>
                                </li>
                                <li><a href="#">치과병원</a><span class="bld_num">YH03</span>
									<div class="map_cont_box" tabindex="0">
										<div class="map_cont">
											<div class="cont_img">
												<p class="img"><img src="/uPNU_homepage/kr/pages/img/campus_map_img/mapimg_YH03.jpg" alt="치과병원" /></p>
												<p class="name"><span class="b_bld_num">YH03</span><span class="b_bld_name">치과병원</span></p>
											</div>
											<p class="cont_txt"></p>
										</div>
									</div>
                                </li>
                                <li><a href="#">한방병원</a><span class="bld_num">YH04</span>
									<div class="map_cont_box" tabindex="0">
										<div class="map_cont">
											<div class="cont_img">
												<p class="img"><img src="/uPNU_homepage/kr/pages/img/campus_map_img/mapimg_YH04.jpg" alt="한방병원" /></p>
												<p class="name"><span class="b_bld_num">YH04</span><span class="b_bld_name">한방병원</span></p>
											</div>
											<p class="cont_txt"></p>
										</div>
									</div>
                                </li>
                                <li><a href="#">재활병원</a><span class="bld_num">YH05</span>
									<div class="map_cont_box" tabindex="0">
										<div class="map_cont">
											<div class="cont_img">
												<p class="img"><img src="/uPNU_homepage/kr/pages/img/campus_map_img/mapimg_YH05.jpg" alt="재활병원" /></p>
												<p class="name"><span class="b_bld_num">YH05</span><span class="b_bld_name">재활병원</span></p>
											</div>
											<p class="cont_txt"></p>
										</div>
									</div>
                                </li>
                                <li><a href="#">전문질활센터</a><span class="bld_num">YH06</span>
									<div class="map_cont_box" tabindex="0">
										<div class="map_cont">
											<div class="cont_img">
												<p class="img"><img src="/uPNU_homepage/kr/pages/img/campus_map_img/mapimg_YH06.jpg" alt="전문질활센터" /></p>
												<p class="name"><span class="b_bld_num">YH06</span><span class="b_bld_name">전문질활센터</span></p>
											</div>
											<p class="cont_txt"></p>
										</div>
									</div>
                                </li>
                                <li><a href="#">한의약임상연구센터</a><span class="bld_num">YH07</span>
									<div class="map_cont_box" tabindex="0">
										<div class="map_cont">
											<div class="cont_img">
												<p class="img"><img src="/uPNU_homepage/kr/pages/img/campus_map_img/mapimg_YH07.jpg" alt="한의약임상연구센터" /></p>
												<p class="name"><span class="b_bld_num">YH07</span><span class="b_bld_name">한의약임상연구센터</span></p>
											</div>
											<p class="cont_txt"></p>
										</div>
									</div>
                                </li>
                                <li><a href="#">NH아리관</a><span class="bld_num">YH08</span>
									<div class="map_cont_box" tabindex="0">
										<div class="map_cont">
											<div class="cont_img">
												<p class="img"><img src="/uPNU_homepage/kr/pages/img/campus_map_img/mapimg_YH08.jpg" alt="NH아리관" /></p>
												<p class="name"><span class="b_bld_num">YH08</span><span class="b_bld_name">NH아리관</span></p>
											</div>
											<p class="cont_txt"></p>
										</div>
									</div>
                                </li>
                                <li><a href="#">교수연구동ㆍ행정동</a><span class="bld_num">YH09</span>
									<div class="map_cont_box" tabindex="0">
										<div class="map_cont">
											<div class="cont_img">
												<p class="img"><img src="/uPNU_homepage/kr/pages/img/campus_map_img/mapimg_YH09.jpg" alt="교수연구동ㆍ행정동" /></p>
												<p class="name"><span class="b_bld_num">YH09</span><span class="b_bld_name">교수연구동ㆍ행정동</span></p>
											</div>
											<p class="cont_txt"></p>
										</div>
									</div>
                                </li>
                            </ul>
                        </div>
                    </div>
                </div>
            </div>
            <div class="btnArea btnC">
                <a href="#"><img src="/uPNU_homepage/kr/pages/img/campus_map_print.gif" alt="Print Map" onclick="void_printstart()" /></a>
                <a href="/uPNU_homepage/kr/pages/etc/양산캠퍼스맵.pdf" target="_blank" title="양산캠퍼스 맵 PDF [새 창]"><img src="/uPNU_homepage/kr/pages/img/campus_map_down.gif" alt="Download Map" /></a>
            </div>
        </div>
        <!-- //양산 캠퍼스 맵 -->

        <!-- 밀양 캠퍼스 맵 -->
        <div class="campus_map" id="miryang">
            <div class="map_img">
                <div class="map_title"><img src="/uPNU_homepage/kr/pages/img/sub_01_07_03_title03.png" alt="MIRYANG CAMPUS 밀양캠퍼스" /></div>
                <!-- 건물명 -->
                <div class="pointer"><span>행정지원본부동, 나노생명과학도서관</span></div>
                <img src="/uPNU_homepage/kr/pages/img/campus_map_03.jpg" alt="밀양캠퍼스 맵"  />
            </div>
            <div class="map_content">
				<!--
                <div class="map_cont_box">
                    <div class="map_cont">
                        <div class="cont_img">
                            <p class="img"><img src="/uPNU_homepage/kr/pages/img/campus_map_0101.gif" alt="제3공학관(105)(기계관)앞" /></p>
                            <p class="name"><span class="b_bld_num">M01</span><span class="b_bld_name">행정지원본부동, 나노생명과학도서관</span></p>
                        </div>
                        <p class="cont_txt">행정지원본부는 밀양캠퍼스의 각종 행정업무를 지원하고, 나노생명과학도서관은 전자저널 및 학술DB 등의 정보서비스를 제공합니다.</p>
                    </div>
                </div>
                -->
                <div class="map_list_wrap">
                    <p class="txt">건물명을 클릭하시면 건물의 위치와 상세내용을 보실 수 있습니다.</p>
                    <div class="map_list my_c">
                        <div class="map_ap_list noline">
                            <ul class="arrow_list">
                                <li><a href="#">행정지원본부동, 나노생명과학도서관</a><span class="bld_num">M01</span>
									<div class="map_cont_box" tabindex="0">
										<div class="map_cont">
											<div class="cont_img">
												<p class="img"><img src="/uPNU_homepage/kr/pages/img/campus_map_img/mapimg_M01.jpg" alt="행정지원본부동, 나노생명과학도서관" /></p>
												<p class="name"><span class="b_bld_num">M01</span><span class="b_bld_name">행정지원본부동, 나노생명과학도서관</span></p>
											</div>
											<p class="cont_txt"></p>
										</div>
									</div>
                                </li>
                                <li><a href="#">나노과학기술관</a><span class="bld_num">M02</span>
									<div class="map_cont_box" tabindex="0">
										<div class="map_cont">
											<div class="cont_img">
												<p class="img"><img src="/uPNU_homepage/kr/pages/img/campus_map_img/mapimg_M02.jpg" alt="나노과학기술관" /></p>
												<p class="name"><span class="b_bld_num">M02</span><span class="b_bld_name">나노과학기술관</span></p>
											</div>
											<p class="cont_txt"></p>
										</div>
									</div>
                                </li>
                                <li><a href="#">생명자원과학관</a><span class="bld_num">M03</span>
									<div class="map_cont_box" tabindex="0">
										<div class="map_cont">
											<div class="cont_img">
												<p class="img"><img src="/uPNU_homepage/kr/pages/img/campus_map_img/mapimg_M03.jpg" alt="생명자원과학관" /></p>
												<p class="name"><span class="b_bld_num">M03</span><span class="b_bld_name">생명자원과학관</span></p>
											</div>
											<p class="cont_txt"></p>
										</div>
									</div>
                                </li>
                                <li><a href="#">학생회관</a><span class="bld_num">M04</span>
									<div class="map_cont_box" tabindex="0">
										<div class="map_cont">
											<div class="cont_img">
												<p class="img"><img src="/uPNU_homepage/kr/pages/img/campus_map_img/mapimg_M04.jpg" alt="학생회관" /></p>
												<p class="name"><span class="b_bld_num">M04</span><span class="b_bld_name">학생회관</span></p>
											</div>
											<p class="cont_txt"></p>
										</div>
									</div>
                                </li>
                                <li><a href="#">비마관 및 매화관, 청학관</a><span class="bld_num">M05</span>
									<div class="map_cont_box" tabindex="0">
										<div class="map_cont">
											<div class="cont_img">
												<p class="img"><img src="/uPNU_homepage/kr/pages/img/campus_map_img/mapimg_M05.jpg" alt="비마관 및 매화관, 청학관" /></p>
												<p class="name"><span class="b_bld_num">M05</span><span class="b_bld_name">비마관 및 매화관, 청학관</span></p>
											</div>
											<p class="cont_txt"></p>
										</div>
									</div>
                                </li>
                                <li><a href="#">부속공장</a><span class="bld_num">M06</span>
									<div class="map_cont_box" tabindex="0">
										<div class="map_cont">
											<div class="cont_img">
												<p class="img"><img src="/uPNU_homepage/kr/pages/img/campus_map_img/mapimg_M06.jpg" alt="부속공장" /></p>
												<p class="name"><span class="b_bld_num">M06</span><span class="b_bld_name">부속공장</span></p>
											</div>
											<p class="cont_txt"></p>
										</div>
									</div>
                                </li>
                                <li><a href="#">전문수위실</a><span class="bld_num">M07</span>
									<div class="map_cont_box" tabindex="0">
										<div class="map_cont">
											<div class="cont_img">
												<p class="img"><img src="/uPNU_homepage/kr/pages/img/campus_map_img/mapimg_M07.jpg" alt="전문수위실" /></p>
												<p class="name"><span class="b_bld_num">M07</span><span class="b_bld_name">전문수위실</span></p>
											</div>
											<p class="cont_txt"></p>
										</div>
									</div>
                                </li>
                                <li><a href="#">운동장</a><span class="bld_num">M08</span>
									<div class="map_cont_box" tabindex="0">
										<div class="map_cont">
											<div class="cont_img">
												<p class="img"><img src="/uPNU_homepage/kr/pages/img/campus_map_img/mapimg_M08.jpg" alt="운동장" /></p>
												<p class="name"><span class="b_bld_num">M08</span><span class="b_bld_name">운동장</span></p>
											</div>
											<p class="cont_txt"></p>
										</div>
									</div>
                                </li>
                                <li><a href="#">공동실험실습관</a><span class="bld_num">M09</span>
									<div class="map_cont_box" tabindex="0">
										<div class="map_cont">
											<div class="cont_img">
												<p class="img"><img src="/uPNU_homepage/kr/pages/img/campus_map_img/mapimg_M09.jpg" alt="공동실험실습관" /></p>
												<p class="name"><span class="b_bld_num">M09</span><span class="b_bld_name">공동실험실습관</span></p>
											</div>
											<p class="cont_txt"></p>
										</div>
									</div>
                                </li>
                                <li><a href="#">테니스장</a><span class="bld_num">M10</span>
									<div class="map_cont_box" tabindex="0">
										<div class="map_cont">
											<div class="cont_img">
												<p class="img"><img src="/uPNU_homepage/kr/pages/img/campus_map_img/mapimg_M10.jpg" alt="테니스장" /></p>
												<p class="name"><span class="b_bld_num">M10</span><span class="b_bld_name">테니스장</span></p>
											</div>
											<p class="cont_txt"></p>
										</div>
									</div>
                                </li>
                                <li><a href="#">첨단온실</a><span class="bld_num">M11</span>
									<div class="map_cont_box" tabindex="0">
										<div class="map_cont">
											<div class="cont_img">
												<p class="img"><img src="/uPNU_homepage/kr/pages/img/campus_map_img/mapimg_M11.jpg" alt="첨단온실" /></p>
												<p class="name"><span class="b_bld_num">M11</span><span class="b_bld_name">첨단온실</span></p>
											</div>
											<p class="cont_txt"></p>
										</div>
									</div>
                                </li>
                            </ul>
                        </div>
                    </div>
                </div>
            </div>
            <div class="btnArea btnC">
                <a href="#"><img src="/uPNU_homepage/kr/pages/img/campus_map_print.gif" alt="Print Map" onclick="void_printstart()" /></a>
                <a href="/uPNU_homepage/kr/pages/etc/밀양캠퍼스맵.pdf" target="_blank" title="밀양캠퍼스 맵 PDF [새 창]"><img src="/uPNU_homepage/kr/pages/img/campus_map_down.gif" alt="Download Map" /></a>
            </div>
        </div>
        <!-- //밀양 캠퍼스 맵 -->

        <!-- 아미 캠퍼스 맵 -->
        <div class="campus_map" id="armi">
            <div class="map_img">
                <div class="map_title"><img src="/uPNU_homepage/kr/pages/img/sub_01_07_03_title04.png" alt="AMI CAMPUS 아미캠퍼스" /></div>
                <!-- 건물명 -->
                <div class="pointer"><span></span></div>
                <img src="/uPNU_homepage/kr/pages/img/campus_map_04.jpg" alt="아미캠퍼스 맵"  />
            </div>
            <div class="map_content">
				<!--
                <div class="map_cont_box">
                    <div class="map_cont">
                        <div class="cont_img">
                            <p class="img"></p>
                            <p class="name"><span class="b_bld_num">AH01</span><span class="b_bld_name">A동 (본관)</span></p>
                        </div>
                        <p class="cont_txt"></p>
                    </div>
                </div>
                -->
                <div class="map_list_wrap" style="margin-top:0;">
                    <p class="txt"><!-- 건물명을 클릭하시면 건물의 위치와 상세내용을 보실 수 있습니다. --></p>
                    <div class="map_list">
                        <div class="map_ap_list noline">
                            <ul class="arrow_list">
                                <li>A동 (본관)<span class="bld_num">AH01</span></li>
                                <li>B동 (외래센터)<span class="bld_num">AH04</span></li>
                                <li>E동 (부산권역 응급의료센터)<span class="bld_num">AH05</span></li>
                                <li>C동 (부산지역 암센터)<span class="bld_num">AH06</span></li>
                                <li>CE (부산지역 암센터 별관)<span class="bld_num">AH07</span></li>
                                <li>주차타워<span class="bld_num">AH08</span></li>
                                <li>H동 (복지동)<span class="bld_num">AH09</span></li>
                                <li>J동 (장기려관)<span class="bld_num">AH10</span></li>
                                <li>의생명 연구원<span class="bld_num">AH20</span></li>
                            </ul>
                        </div>
                    </div>
                </div>
            </div>
            <div class="btnArea btnC">
                <a href="#"><img src="/uPNU_homepage/kr/pages/img/campus_map_print.gif" alt="Print Map" onclick="void_printstart()" /></a>
            </div>
        </div>
        <!-- //아미 캠퍼스 맵 -->

        <!-- //캠퍼스 맵
        <div class="btnArea btnC mt20">
            <a href="#"><img src="/uPNU_homepage/kr/pages/img/campus_map_print.gif" alt="Print Map" onclick="void_printstart()" /></a>
            <a href="#"><img src="/uPNU_homepage/kr/pages/img/campus_map_down.gif" alt="Download Map" /></a>
        </div>
             -->
	</div>
</body>
</html>