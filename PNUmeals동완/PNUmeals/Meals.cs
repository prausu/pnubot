using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

using System.Text;
using System.Threading.Tasks;
using agi = HtmlAgilityPack;
using System.Net;

using Microsoft.Bot.Builder.Dialogs;
using Microsoft.Bot.Builder.FormFlow;
using Microsoft.Bot.Builder.FormFlow.Advanced;

#pragma warning disable CS1998 // Async method lacks 'await' operators and will run synchronously

namespace PNUmeals
{
    class Meals
    {
        private string today; //오늘 요일
        private string restaurant;       //식당 이름    
        private string allmenu = ""; //해당 식당 전체 메뉴
        private string selectedmenu=""; //해당식당 해당요일 메뉴

        private string url; //각 식당의 url
        
        public string selectedMenu()
        {
            return selectedmenu;
        } //getter

        public void setUrl(string url)
        {
            this.url = url;
            LoadingHtml();
        }
        public void setRestaurant(string rest)
        {
            restaurant = rest;
        }
        public string getToday()
        {
            return today;
        }

        public void whatDay()
        {
            DateTime dateToday = DateTime.Today;
            string strNow_DayOfWeek = dateToday.DayOfWeek.ToString();

            switch (strNow_DayOfWeek)
            {
                case "Monday":
                    today = "월요일";
                    setMon();
                    break;
                case "Tuesday":
                    today = "화요일";
                    setTue();
                    break;
                case "Wednesday":
                    today = "수요일";
                    setWed();
                    break;
                case "Thursday":
                    today = "목요일";
                    setThu();
                    break;
                case "Friday":
                    today = "금요일";
                    setFri();
                    break;
                case "Saturday":
                    today = "토요일";
                    setSat();
                    break;
                case "Sunday":
                    today = "일요일";
                    break;
            }
        }

        private void LoadingHtml()
        {
            WebClient wc = new WebClient();
            wc.Encoding = Encoding.UTF8;
            string html = wc.DownloadString(url);
            agi.HtmlDocument doc = new agi.HtmlDocument();
            doc.LoadHtml(html);

            agi.HtmlNode[] nodes = doc.DocumentNode.SelectNodes("//td").ToArray();

            foreach (agi.HtmlNode item in nodes)
            {
                allmenu = allmenu.Insert(allmenu.Length, item.InnerHtml);
                allmenu = allmenu.Insert(allmenu.Length, "\r\n");
            }
            allmenu = allmenu.Replace("<br>", string.Empty);
        }
                
        private string getTitle(int cnt)  //cnt가 1이면 첫번째 타이틀, 2이면 두번째 타이틀
        {
            string temp = "";
            switch (restaurant)
            {
                case "금정회관":
                case "금정":
                    if (cnt == 1)
                        temp = "금정회관 1층\r\n";
                    else
                        temp = "금정회관 2층\r\n";
                    break;
                case "문창회관":
                case "문창":
                    if (cnt == 1)
                        temp = "문창회관 교직원식당\r\n";
                    else
                        temp = "문창회관 학생식당\r\n";
                    break;
                case "샛벌회관":
                case "샛벌":
                    temp = "샛벌회관 1층\r\n";
                    break;
                case "부산":
                    if (cnt == 1)
                        temp = "학생회관(부산) 교직원식당\r\n";
                    else
                        temp = "학생회관(부산) 학생식당\r\n";
                    break;
                case "밀양":
                    if (cnt == 1)
                        temp = "학생회관(밀양) 교직원식당\r\n";
                    else
                        temp = "학생회관(밀양) 학생식당\r\n";
                    break;
                case "양산":
                    if (cnt == 1)
                        temp = "간호관회관(양산) 교직원식당\r\n";
                    else
                        temp = "간호관회관(양산) 학생식당\r\n";
                    break;
            }
            return temp;
        }

        public void setMon()
        {
            int start, end;
            LoadingHtml();
            string temp = "";
            temp = temp.Insert(0, getTitle(1));

            if (allmenu.Contains("메뉴가 존재하지 않습니다"))
            {
                selectedmenu = "메뉴가 존재하지 않습니다.";
                return;
            }

            else
            {
                start = allmenu.IndexOf("월요일");
                end = allmenu.IndexOf("화요일");

                temp = temp.Insert(temp.Length, allmenu.Substring(start + 3, end - start - 3));

                if (restaurant == "샛벌회관") { }

                else
                {
                    temp = temp.Insert(temp.Length, "----------------\r\n");
                    temp = temp.Insert(temp.Length, getTitle(2));
                    
                    start = allmenu.IndexOf("월요일", start + 1);
                    end = allmenu.IndexOf("화요일", end + 1);
                    temp = temp.Insert(temp.Length, allmenu.Substring(start + 3, end - start - 3));
                }
            }
            selectedmenu = temp;   
        }
        public void setTue()
        {
            int start, end;
            LoadingHtml();
            string temp = "";
            temp = temp.Insert(0, getTitle(1));

            if (allmenu.Contains("메뉴가 존재하지 않습니다"))
            {
                selectedmenu ="메뉴가 존재하지 않습니다.";
                return;
            }

            else
            {
                start = allmenu.IndexOf("화요일");
                end = allmenu.IndexOf("수요일");

                temp = temp.Insert(temp.Length, allmenu.Substring(start + 3, end - start - 3));

                if (restaurant == "샛벌회관") { }

                else
                {
                    temp = temp.Insert(temp.Length, "----------------\r\n");
                    temp = temp.Insert(temp.Length, getTitle(2));
                    
                    start = allmenu.IndexOf("화요일", start + 1);
                    end = allmenu.IndexOf("수요일", end + 1);
                    temp = temp.Insert(temp.Length, allmenu.Substring(start + 3, end - start - 3));
                }
            }
            selectedmenu = temp;
        }
        public void setWed()
        {
            int start, end;
            LoadingHtml();
            string temp = "";
            temp = temp.Insert(0, getTitle(1));

            if (allmenu.Contains("메뉴가 존재하지 않습니다"))
            {
                selectedmenu = "메뉴가 존재하지 않습니다.";
                return;
            }

            else
            {
                start = allmenu.IndexOf("수요일");
                end = allmenu.IndexOf("목요일");

                temp = temp.Insert(temp.Length, allmenu.Substring(start + 3, end - start - 3));

                if (restaurant == "샛벌회관") { }

                else
                {
                    temp = temp.Insert(temp.Length, "----------------\r\n");
                    temp = temp.Insert(temp.Length, getTitle(2));
                    

                    start = allmenu.IndexOf("수요일", start + 1);
                    end = allmenu.IndexOf("목요일", end + 1);
                    temp = temp.Insert(temp.Length, allmenu.Substring(start + 3, end - start - 3));
                }
            }

            selectedmenu = temp;
        }
        public void setThu()
        {
            int start, end;
            LoadingHtml();
            string temp = "";
            temp = temp.Insert(0, getTitle(1));

            if (allmenu.Contains("메뉴가 존재하지 않습니다"))
            {
                selectedmenu = "메뉴가 존재하지 않습니다.";
                return;
            }

            else
            {
                start = allmenu.IndexOf("목요일");
                end = allmenu.IndexOf("금요일");

                temp = temp.Insert(temp.Length, allmenu.Substring(start + 3, end - start - 3));

                if (restaurant == "샛벌회관") { }

                else
                {
                    temp = temp.Insert(temp.Length, "----------------\r\n");
                    temp = temp.Insert(temp.Length, getTitle(2));

                    start = allmenu.IndexOf("목요일", start + 1);
                    end = allmenu.IndexOf("금요일", end + 1);
                    temp = temp.Insert(temp.Length, allmenu.Substring(start + 3, end - start - 3));
                }
            }

            selectedmenu = temp;
        }
        public void setFri()
        {
            int start, end;
            LoadingHtml();
            string temp = "";
            temp = temp.Insert(0, getTitle(1));

            if (allmenu.Contains("메뉴가 존재하지 않습니다"))
            {
                selectedmenu = "메뉴가 존재하지 않습니다.";
                return;
            }

            else
            {
                start = allmenu.IndexOf("금요일");
                end = allmenu.IndexOf("토요일");

                temp = temp.Insert(temp.Length, allmenu.Substring(start + 3, end - start - 3));

                if (restaurant == "샛벌회관") { }

                else
                {
                    temp = temp.Insert(temp.Length, "----------------\r\n");
                    temp = temp.Insert(temp.Length, getTitle(2));

                    start = allmenu.IndexOf("금요일", start + 1);
                    end = allmenu.IndexOf("토요일", end + 1);
                    temp = temp.Insert(temp.Length, allmenu.Substring(start + 3, end - start - 3));
                }
            }

            selectedmenu = temp;
        }
        public void setSat()
        {
            int start, end;
            LoadingHtml();
            string temp = "";
            temp = temp.Insert(0, getTitle(1));
            if (allmenu.Contains("메뉴가 존재하지 않습니다"))
            {
                selectedmenu = "메뉴가 존재하지 않습니다.";
                return;
            }

            else
            {
                start = allmenu.IndexOf("토요일");
                end = allmenu.IndexOf("월요일", allmenu.IndexOf("월요일") + 1);

                temp = temp.Insert(temp.Length, allmenu.Substring(start + 3, end - start - 3));

                if (restaurant == "샛벌회관") { }

                else
                {
                    temp = temp.Insert(temp.Length, "----------------\r\n");
                    temp = temp.Insert(temp.Length, getTitle(2));

                    start = allmenu.IndexOf("토요일", start + 1);
                    end = allmenu.LastIndexOf("석식");
                    temp = temp.Insert(temp.Length, allmenu.Substring(start + 3, end - start - 1));
                }
            }
            selectedmenu = temp;
        }        
    }
    
    public enum MealsRestOptions
    {
        금정회관, 문창회관, 샛벌회관, 부산, 밀양, 양산
    }

    public enum MealsDayOptions
    {
        오늘, 월요일, 화요일, 수요일, 목요일, 금요일, 토요일
    }

    [Template(TemplateUsage.NotUnderstood, "다시 입력해주세요.\"{0}\"")]

    [Serializable]
    public class MealsOrder
    {
        [Prompt("학생회관을 선택해주세요. {||}")]
        public MealsRestOptions? Restaurant;

        [Prompt("요일을 선택해주세요. {||}")]
        public MealsDayOptions? Day;
        
        public static IForm<MealsOrder> BuildForm()
        {
            Meals menu = new Meals();

            return new FormBuilder<MealsOrder>()
                .Field(nameof(Restaurant))
                .Field(nameof(Day))
                .Confirm(async state =>
                {
                    switch (state.Restaurant)
                    {
                        case MealsRestOptions.금정회관:
                            menu.setUrl("http://www.pusan.ac.kr/uPNU_homepage/kr/pages/1001060902.asp?sikdang_cd1=01&sikdang_cd2=02");
                            menu.setRestaurant("금정회관");
                            break;
                        case MealsRestOptions.문창회관:
                            menu.setUrl("http://www.pusan.ac.kr/uPNU_homepage/kr/pages/1001060902.asp?sikdang_cd1=03&sikdang_cd2=04");
                            menu.setRestaurant("문창회관");
                            break;
                        case MealsRestOptions.샛벌회관:
                            menu.setUrl("http://www.pusan.ac.kr/uPNU_homepage/kr/pages/1001060902.asp?sikdang_cd1=05&sikdang_cd2=06");
                            menu.setRestaurant("샛벌회관");
                            break;
                        case MealsRestOptions.부산:
                            menu.setUrl("http://www.pusan.ac.kr/uPNU_homepage/kr/pages/1001060902.asp?sikdang_cd1=07&sikdang_cd2=08");
                            menu.setRestaurant("부산");
                            break;
                        case MealsRestOptions.밀양:
                            menu.setUrl("http://www.pusan.ac.kr/uPNU_homepage/kr/pages/1001060902.asp?sikdang_cd1=09&sikdang_cd2=10");
                            menu.setRestaurant("밀양");
                            break;
                        case MealsRestOptions.양산:
                            menu.setUrl("http://www.pusan.ac.kr/uPNU_homepage/kr/pages/1001060902.asp?sikdang_cd1=11&sikdang_cd2=12");
                            menu.setRestaurant("양산");
                            break;
                    }
                    switch (state.Day)
                    {
                        case MealsDayOptions.월요일:
                            menu.setMon();
                            break;
                        case MealsDayOptions.화요일:
                            menu.setTue();
                            break;
                        case MealsDayOptions.수요일:
                            menu.setWed();
                            break;
                        case MealsDayOptions.목요일:
                            menu.setThu();
                            break;
                        case MealsDayOptions.금요일:
                            menu.setFri();
                            break;
                        case MealsDayOptions.토요일:
                            menu.setSat();
                            break;
                        case MealsDayOptions.오늘:
                            menu.whatDay();
                            break;
                    }

                    return new PromptAttribute($"{ menu.selectedMenu() } 찾으시는 메뉴가 맞습니까? (yes / no)");
                })
                .Message("감사합니다.")         
                .Build();
        }
    }
}