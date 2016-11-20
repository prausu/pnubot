using System;
using System.Linq;

using System.Text;
using agi = HtmlAgilityPack;
using System.Net;
using Microsoft.Bot.Builder.FormFlow;


#pragma warning disable 649
#pragma warning disable CS1998 // Async method lacks 'await' operators and will run synchronously

namespace PNU.Controllers
{

    public enum building_option
    {
        [Terms("중앙도서관 제1열람실", "중앙도서관제1열람실","중도제1열람실")]중앙도서관_제1열람실 = 1,
        [Terms("중앙도서관 제1노트북열람실", "중앙도서관제1노트북열람실","중도제1노트북열람실")]중앙도서관_제1노트북열람실 = 2,
        [Terms("중앙도서관 제2의1열람실", "중앙도서관제2의1열람실", "중앙도서관 제2의 1열람실","중도제2의1열람실")]중앙도서관_제2의1열람실 = 3,
        [Terms("중앙도서관 제2의2열람실", "중앙도서관 제2의 2열람실", "중앙도서관제2의2열람실","중도제2의2열람실")]중앙도서관_제2의2열람실 = 4,
        [Terms("중앙도서관 제3의1열람실", "중앙도서관 제3의 1열람실", "중앙도서관제3의1열람실","중도제3의1열람실")]중앙도서관_제3의1열람실 = 5,
        [Terms("중앙도서관 제3의2열람실", "중앙도서관 제3의 2열람실", "중앙도서관 제3의2열람실","중앙도서관제3의2열람실")]중앙도서관_제3의2열람실 = 6,
        [Terms("중앙도서관 대학원열람실", "중앙도서관대학원열람실","중도대학원열람실")]중앙도서관_대학원열람실 = 7,
        [Terms("중앙도서관 제2노트북열람실", "중앙도서관제2노트북열람실","중도제2노트북열람실")]중앙도서관_제2노트북열람실 = 8,
        [Terms("건설관 제1열람실", "건설관제1열람실")]건설관_제1열람실 = 9,
        [Terms("건설관 제2열람실", "건설관제2열람실")]건설관_제2열람실 = 10,
        [Terms("건설관 제3열람실", "건설관제3열람실")]건설관_제3열람실 = 11,
        [Terms("건설관 대학원열람실", "건설관대학원열람실")]건설관_대학원열람실 = 12
    }


    [Template(TemplateUsage.NotUnderstood, "다시 입력해주세요.\"{0}\"")]
    [Serializable]
    public class Library
    {
        [Prompt("건물과 열람실을 선택해 주세요{||}")]
        public building_option? empty_seat;


        public static IForm<Library> BuildForm()
        {
            string empty = "";
            string total = "";
            string result = "";
            parshing down_parshing = new parshing();
            down_parshing.LoadingHtml();

            return new FormBuilder<Library>()
                .Message("▼ 좌석을 알아볼 열람실을 입력하세요 ▼")
                .Field(nameof(empty_seat))
                .Confirm(async state =>
                {
                    switch (state.empty_seat)
                    {
                        case building_option.중앙도서관_제1열람실:
                            empty = down_parshing.empty_seats.Substring(down_parshing.empty_seats.IndexOf("2층 1열람실") + 11, 5);
                            total = down_parshing.empty_seats.Substring(down_parshing.empty_seats.IndexOf("2층 1열람실") + 18, 5);
                            result = "중앙도서관_제1열람실";
                            break;
                        case building_option.중앙도서관_제1노트북열람실:
                            empty = down_parshing.empty_seats.Substring(down_parshing.empty_seats.IndexOf("2층  1노트북 열람실") + 16, 5);
                            total = down_parshing.empty_seats.Substring(down_parshing.empty_seats.IndexOf("2층  1노트북 열람실") + 23, 5);
                            result = "중앙도서관_제1노트북열람실";
                            break;
                        case building_option.중앙도서관_제2의1열람실:
                            empty = down_parshing.empty_seats.Substring(down_parshing.empty_seats.IndexOf("3층 2-1열람실") + 13, 5);
                            total = down_parshing.empty_seats.Substring(down_parshing.empty_seats.IndexOf("3층 2-1열람실") + 20, 5);
                            result = "중앙도서관_제2_1열람실";
                            break;
                        case building_option.중앙도서관_제2의2열람실:
                            empty = down_parshing.empty_seats.Substring(down_parshing.empty_seats.IndexOf("3층 2-2열람실") + 14, 5);
                            total = down_parshing.empty_seats.Substring(down_parshing.empty_seats.IndexOf("3층 2-2열람실") + 21, 5);
                            result = "중앙도서관_제2_2열람실";
                            break;
                        case building_option.중앙도서관_제3의1열람실:
                            empty = down_parshing.empty_seats.Substring(down_parshing.empty_seats.IndexOf("4층 3-1열람실") + 13, 5);
                            total = down_parshing.empty_seats.Substring(down_parshing.empty_seats.IndexOf("4층 3-1열람실") + 20, 5);
                            result = "중앙도서관_제3_1열람실";
                            break;
                        case building_option.중앙도서관_제3의2열람실:
                            empty = down_parshing.empty_seats.Substring(down_parshing.empty_seats.IndexOf("4층 3-2열람실") + 13, 5);
                            total = down_parshing.empty_seats.Substring(down_parshing.empty_seats.IndexOf("4층 3-2열람실") + 20, 5);
                            result = "중앙도서관_제3_2열람실";
                            break;
                        case building_option.중앙도서관_대학원열람실:
                            empty = down_parshing.empty_seats.Substring(down_parshing.empty_seats.IndexOf("4층 대학원 열람실") + 14, 4);
                            total = down_parshing.empty_seats.Substring(down_parshing.empty_seats.IndexOf("4층 대학원 열람실") + 20, 4);
                            result = "중앙도서관_대학원열람실";
                            break;
                        case building_option.중앙도서관_제2노트북열람실:
                            empty = down_parshing.empty_seats.Substring(down_parshing.empty_seats.IndexOf("4층 2노트북 열람실") + 15, 5);
                            total = down_parshing.empty_seats.Substring(down_parshing.empty_seats.IndexOf("4층 2노트북 열람실") + 22, 5);
                            result = "중앙도서관_제2노트북열람실";
                            break;
                        case building_option.건설관_제1열람실:
                            empty = down_parshing.empty_seats.Substring(down_parshing.empty_seats.IndexOf("3층 제1열람실") + 12, 5);
                            total = down_parshing.empty_seats.Substring(down_parshing.empty_seats.IndexOf("3층 제1열람실") + 19, 5);
                            result = "건설관_제1열람실";
                            break;
                        case building_option.건설관_제2열람실:
                            empty = down_parshing.empty_seats.Substring(down_parshing.empty_seats.IndexOf("3층 제2열람실") + 12, 5);
                            total = down_parshing.empty_seats.Substring(down_parshing.empty_seats.IndexOf("3층 제2열람실") + 19, 5);
                            result = "건설관_제2열람실";
                            break;
                        case building_option.건설관_제3열람실:
                            empty = down_parshing.empty_seats.Substring(down_parshing.empty_seats.IndexOf("4층 제3열람실") + 12, 5);
                            total = down_parshing.empty_seats.Substring(down_parshing.empty_seats.IndexOf("4층 제3열람실") + 19, 5);
                            result = "건설관_제3열람실";
                            break;
                        case building_option.건설관_대학원열람실:
                            empty = down_parshing.empty_seats.Substring(down_parshing.empty_seats.IndexOf("4층 시간강사(대학원)열람실") + 19, 5);
                            total = down_parshing.empty_seats.Substring(down_parshing.empty_seats.IndexOf("4층 시간강사(대학원)열람실") + 26, 5);
                            result = "건설관_대학원열람실";
                            break;
                    }


                    return new PromptAttribute($" {result}은 총 {total}개의 좌석중 {empty}개의 좌석이 남아있습니다. \n(다른 열람실을 보시려면 숫자 1을 입력해주세요.)");
                })
                
                .Build();
        }
    }

    public class parshing
    {

        public string empty_seats = "";
        public void LoadingHtml()
        {
            WebClient wc = new WebClient();
            wc.Encoding = Encoding.UTF8;
            string html = wc.DownloadString("http://164.125.8.209:8080/room_cnt_info.aspx");
            var doc = new agi.HtmlDocument();
            doc.LoadHtml(html);

            agi.HtmlNode[] nodes = doc.DocumentNode.SelectNodes("//td").ToArray();

            foreach (agi.HtmlNode item in nodes)
            {
                empty_seats = empty_seats.Insert(empty_seats.Length, item.InnerHtml);
                empty_seats = empty_seats.Insert(empty_seats.Length, "\r\n");
            }
            empty_seats = empty_seats.Replace("<br>", string.Empty);
            //Console.WriteLine(empty_seat);
        }

    }
}