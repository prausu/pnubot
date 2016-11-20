using System;
using System.Linq;
using System.Net;
using System.Net.Http;
using System.Threading.Tasks;
using System.Web.Http;
using System.Web.Http.Description;
using Microsoft.Bot.Connector;
using Newtonsoft.Json;
using System.Collections.Generic;

namespace pnubot
{
    public class Building
    {
        public Building() { }


        // Properties.
        public int ID { get; set; }
        public string Name { get; set; }
        public string Adrress { get; set; }


        public override string ToString()
        {
            return ID + " " + Name + " " + Adrress;
        }
    }


    [BotAuthentication]
    public class MessagesController : ApiController
    {
        /// <summary>
        /// POST: api/Messages
        /// Receive a message from a user and reply to it
        /// </summary>
        /// 

        List<Building> buildings = new List<Building>()
{
    new Building {ID=101, Name="MEMS/NANO클린룸동", Adrress="미입력"},
    new Building {ID=102, Name="제1부속공장", Adrress="http://map.naver.com/?dlevel=14&pinType=site&pinId=16889079&x=129.0833500&y=35.2306179&enc=b64"},
    new Building {ID=103, Name="제12공학관", Adrress="미입력"},
    new Building {ID=105, Name="제3공학관(기계관)", Adrress="http://map.naver.com/?dlevel=14&pinType=site&pinId=16892545&x=129.0835500&y=35.2311430&enc=b64"},
    new Building {ID=106, Name="효원문화회관", Adrress="http://map.naver.com/?dlevel=12&pinType=site&pinId=16889805&x=129.0840561&y=35.2320456&enc=b64"},
    new Building {ID=107, Name="제8공학관(항공관)", Adrress="http://map.naver.com/?dlevel=12&pinType=site&pinId=16892353&x=129.0837880&y=35.2330260&enc=b64"},
    new Building {ID=108, Name="제9공학관(기전관)", Adrress="http://map.naver.com/?dlevel=12&pinType=site&pinId=16888086&x=129.0841500&y=35.2331430&enc=b64"},
    new Building {ID=109, Name="공과대학공동실험관", Adrress="미입력"},
    new Building {ID=110, Name="에너지분야실험실", Adrress="http://map.naver.com/?dlevel=12&pinType=site&pinId=16888757&x=129.0843000&y=35.2332930&enc=b64"},
    new Building {ID=111, Name="실험폐기물처리장", Adrress="미입력"},
    new Building {ID=201, Name="제6공학관(컴퓨터공학관)", Adrress="http://map.naver.com/?dlevel=12&pinType=site&pinId=16893916&x=129.0822389&y=35.2309907&enc=b64"},
    new Building {ID=202, Name="운죽정(국제지원센터)", Adrress="http://map.naver.com/?dlevel=14&pinType=site&pinId=16894134&x=129.0817138&y=35.2312982&enc=b64"},
    new Building {ID=203, Name="넉넉한터,넉터", Adrress="http://map.naver.com/?dlevel=12&pinType=site&pinId=16889085&x=129.0824116&y=35.2316027&enc=b64"},
    new Building {ID=204, Name="넉넉한터지하주차장", Adrress="http://map.naver.com/?dlevel=12&pinType=site&pinId=16889085&x=129.0824116&y=35.2316027&enc=b64"},
    new Building {ID=205, Name="대학본부", Adrress="http://map.naver.com/?dlevel=12&pinType=site&pinId=16887718&x=129.0827870&y=35.2325600&enc=b64"},
    new Building {ID=206, Name="제11공학관(조선해양공학관)", Adrress="http://map.naver.com/?dlevel=14&pinType=site&pinId=16891788&x=129.0823130&y=35.2326350&enc=b64"},
    new Building {ID=207, Name="제10공학관(특성화공학관)", Adrress="http://map.naver.com/?dlevel=14&pinType=site&pinId=16890831&x=129.0829000&y=35.2332350&enc=b64"},
    new Building {ID=208, Name="기계기술연구동", Adrress="http://map.naver.com/?dlevel=12&pinType=site&pinId=16890911&x=129.0829880&y=35.2337680&enc=b64"},
    new Building {ID=209, Name="상남국제회관", Adrress="http://map.naver.com/?dlevel=14&pinType=site&pinId=16894963&x=129.0842000&y=35.2358850&enc=b64"},
    new Building {ID=210, Name="국제언어교육원", Adrress="http://map.naver.com/?dlevel=14&pinType=site&pinId=16893666&x=129.0834870&y=35.2359510&enc=b64"},
    new Building {ID=211, Name="보육종합센터", Adrress="http://map.naver.com/?dlevel=14&pinType=site&pinId=21274452&x=129.0834320&y=35.2366265&enc=b64"},
    new Building {ID=301, Name="구조실험동", Adrress="http://map.naver.com/?dlevel=12&pinType=site&pinId=16890530&x=129.0811120&y=35.2301760&enc=b64"},
    new Building {ID=302, Name="토조실험동", Adrress="미입력"},
    new Building {ID=303, Name="제1공학관", Adrress="미입력"},
    new Building {ID=305, Name="제4공학관", Adrress="미입력"},
    new Building {ID=306, Name="인문관", Adrress="http://map.naver.com/?dlevel=12&pinType=site&pinId=16893460&x=129.0812875&y=35.2322596&enc=b64"},
    new Building {ID=307, Name="인문대교수연구동", Adrress="http://map.naver.com/?dlevel=12&pinType=site&pinId=16894302&x=129.0810750&y=35.2328510&enc=b64"},
    new Building {ID=308, Name="제1물리관", Adrress="http://map.naver.com/?dlevel=12&pinType=site&pinId=16890138&x=129.0812250&y=35.2338510&enc=b64"},
    new Building {ID=309, Name="제2물리관", Adrress="http://map.naver.com/?dlevel=12&pinType=site&pinId=16890138&x=129.0812250&y=35.2338510&enc=b64"},
    new Building {ID=310, Name="문창회관", Adrress="http://map.naver.com/?dlevel=12&pinType=site&pinId=16887586&x=129.0818750&y=35.2340596&enc=b64"},
    new Building {ID=311, Name="공동연구기기동", Adrress="http://map.naver.com/?dlevel=12&pinType=site&pinId=36029715&x=129.0827311&y=35.2345306&enc=b64"},
    new Building {ID=312, Name="공동실험실습관", Adrress="http://map.naver.com/?dlevel=12&pinType=site&pinId=16890079&x=129.0822370&y=35.2343510&enc=b64"},
    new Building {ID=313, Name="자연대연구실험동", Adrress="http://map.naver.com/?dlevel=14&pinType=site&pinId=16893934&x=129.0827250&y=35.2351260&enc=b64"},
    new Building {ID=314, Name="정보전산원교육관", Adrress="미입력"},
    new Building {ID=315, Name="자유관A동", Adrress="http://map.naver.com/?dlevel=12&pinType=site&pinId=16889555&x=129.0824444&y=35.2356925&enc=b64"},
    new Building {ID=316, Name="자유관B동", Adrress="http://map.naver.com/?dlevel=12&pinType=site&pinId=16890308&x=129.0823139&y=35.2360203&enc=b64"},
    new Building {ID=317, Name="자유관관리동", Adrress="http://map.naver.com/?dlevel=14&pinType=site&pinId=16892536&x=129.0824880&y=35.2363430&enc=b64"},
    new Building {ID=318, Name="외인교수아파트", Adrress="http://map.naver.com/?dlevel=12&pinType=site&pinId=16892936&x=129.0825750&y=35.2367850&enc=b64"},
    new Building {ID=319, Name="통합기계관", Adrress="http://map.naver.com/?dlevel=14&pinType=site&pinId=37114262&x=129.0807808&y=35.2306188&enc=b64"},
    new Building {ID=401, Name="건설관", Adrress="http://map.naver.com/?dlevel=12&pinType=site&pinId=16889293&x=129.0798756&y=35.2311466&enc=b64"},
    new Building {ID=402, Name="정학관", Adrress="http://map.naver.com/?dlevel=12&pinType=site&pinId=16887797&x=129.0788500&y=35.2314930&enc=b64"},
    new Building {ID=403, Name="10.16기념관", Adrress="http://map.naver.com/?dlevel=12&pinType=site&pinId=16893270&x=129.0798130&y=35.2317010&enc=b64"},
    new Building {ID=405, Name="제2공학관(재료관)", Adrress="http://map.naver.com/?dlevel=14&pinType=site&pinId=16892643&x=129.0800750&y=35.2321760&enc=b64"},
    new Building {ID=406, Name="제7공학관(화공관)", Adrress="http://map.naver.com/?dlevel=12&pinType=site&pinId=16888869&x=129.0796880&y=35.2323930&enc=b64"},
    new Building {ID=407, Name="선박예인수조연구동", Adrress="http://map.naver.com/?dlevel=14&pinType=site&pinId=16891076&x=129.0793630&y=35.2328510&enc=b64"},
    new Building {ID=408, Name="제5공학관(유기소재관)", Adrress="http://map.naver.com/?dlevel=12&pinType=site&pinId=16892711&x=129.0791399&y=35.2324240&enc=b64"},
    new Building {ID=409, Name="교수회관", Adrress="http://map.naver.com/?dlevel=12&pinType=site&pinId=16888812&x=129.0801750&y=35.2329680&enc=b64"},
    new Building {ID=410, Name="선박충격ㆍ피로ㆍ도장ㆍ시험연구동", Adrress="미입력"},
    new Building {ID=411, Name="자연과학관", Adrress="미입력"},
    new Building {ID=412, Name="박물관A", Adrress="http://map.naver.com/?dlevel=12&pinType=site&pinId=11620682&x=129.0803681&y=35.2337641&enc=b64"},
    new Building {ID=413, Name="박물관B", Adrress="http://map.naver.com/?dlevel=12&pinType=site&pinId=11620682&x=129.0803681&y=35.2337641&enc=b64"},
    new Building {ID=414, Name="지구관", Adrress="http://map.naver.com/?dlevel=12&pinType=site&pinId=16893706&x=129.0796630&y=35.2339010&enc=b64"},
    new Building {ID=415, Name="샛벌회관", Adrress="http://map.naver.com/?dlevel=12&pinType=site&pinId=16893259&x=129.0796830&y=35.2341541&enc=b64"},
    new Building {ID=416, Name="생물관", Adrress="http://map.naver.com/?dlevel=12&pinType=site&pinId=16893481&x=129.0810750&y=35.2348760&enc=b64"},
    new Building {ID=417, Name="제1사범관", Adrress="http://map.naver.com/?dlevel=12&pinType=site&pinId=16891100&x=129.0801750&y=35.2346100&enc=b64"},
    new Building {ID=418, Name="제2교수연구동", Adrress="http://map.naver.com/?dlevel=12&pinType=site&pinId=16890638&x=129.0802250&y=35.2350600&enc=b64"},
    new Building {ID=419, Name="금정회관", Adrress="http://map.naver.com/?dlevel=12&pinType=site&pinId=16889071&x=129.0802380&y=35.2354010&enc=b64"},
    new Building {ID=420, Name="제2도서관", Adrress="http://map.naver.com/?dlevel=12&pinType=site&pinId=16889620&x=129.0813125&y=35.2357263&enc=b64"},
    new Building {ID=421, Name="사회관", Adrress="http://map.naver.com/?dlevel=14&pinType=site&pinId=16888062&x=129.0804370&y=35.2362850&enc=b64"},
    new Building {ID=422, Name="성학관", Adrress="http://map.naver.com/?dlevel=12&pinType=site&pinId=16887783&x=129.0816870&y=35.2365510&enc=b64"},
    new Building {ID=501, Name="약학연구동", Adrress="http://map.naver.com/?dlevel=12&pinType=site&pinId=16888598&x=129.0784380&y=35.2320680&enc=b64"},
    new Building {ID=502, Name="약학관(구관)", Adrress="http://map.naver.com/?dlevel=12&pinType=site&pinId=16888598&x=129.0784380&y=35.2320680&enc=b64"},
    new Building {ID=503, Name="약학관(신관)", Adrress="http://map.naver.com/?dlevel=12&pinType=site&pinId=16888598&x=129.0784380&y=35.2320680&enc=b64"},
    new Building {ID=505, Name="실험동물센터", Adrress="미입력"},
    new Building {ID=506, Name="효원산학협동관", Adrress="http://map.naver.com/?dlevel=12&pinType=site&pinId=19372474&x=129.0786338&y=35.2326962&enc=b64"},
    new Building {ID=507, Name="인덕관", Adrress="http://map.naver.com/?dlevel=12&pinType=site&pinId=16891381&x=129.0787875&y=35.2329429&enc=b64"},
    new Building {ID=508, Name="산학협동관", Adrress="미입력"},
    new Building {ID=509, Name="박물관별관", Adrress="http://map.naver.com/?dlevel=12&pinType=site&pinId=16888307&x=129.0790130&y=35.2334430&enc=b64"},
    new Building {ID=510, Name="제1도서관", Adrress="http://map.naver.com/?dlevel=12&pinType=site&pinId=16894953&x=129.0783625&y=35.2341833&enc=b64"},
    new Building {ID=511, Name="간이체육관", Adrress="미입력"},
    new Building {ID=512, Name="테니스장", Adrress="http://map.naver.com/?dlevel=12&pinType=site&pinId=21513022&x=129.0792821&y=35.2352384&enc=b64"},
    new Building {ID=513, Name="철골주차장", Adrress="미입력"},
    new Building {ID=514, Name="경영관", Adrress="http://map.naver.com/?dlevel=12&pinType=site&pinId=16891373&x=129.0795630&y=35.2366010&enc=b64"},
    new Building {ID=515, Name="제1도서관및정보전산원", Adrress="http://map.naver.com/?dlevel=12&pinType=site&pinId=16893006&x=129.0790080&y=35.2340384&enc=b64"},
    new Building {ID=516, Name="경제통상관", Adrress="미입력"},
    new Building {ID=601, Name="예술관", Adrress="http://map.naver.com/?dlevel=12&pinType=site&pinId=16889897&x=129.0769880&y=35.2326260&enc=b64"},
    new Building {ID=602, Name="생활환경관", Adrress="http://map.naver.com/?dlevel=12&pinType=site&pinId=16889360&x=129.0774500&y=35.2335180&enc=b64"},
    new Building {ID=603, Name="생활환경대실험실습동", Adrress="http://map.naver.com/?dlevel=14&pinType=site&pinId=16889371&x=129.0774000&y=35.2338100&enc=b64"},
    new Building {ID=605, Name="학군단", Adrress="http://map.naver.com/?dlevel=12&pinType=site&pinId=16890858&x=129.0780370&y=35.2348100&enc=b64"},
    new Building {ID=606, Name="화학관", Adrress="http://map.naver.com/?dlevel=12&pinType=site&pinId=16889606&x=129.0776630&y=35.2350350&enc=b64"},
    new Building {ID=607, Name="공동연구소동", Adrress="http://map.naver.com/?dlevel=14&pinType=site&pinId=16890095&x=129.0783000&y=35.2357513&enc=b64"},
    new Building {ID=608, Name="제2법학관", Adrress="http://map.naver.com/?dlevel=12&pinType=site&pinId=16893198&x=129.0785120&y=35.2368850&enc=b64"},
    new Building {ID=609, Name="법학관", Adrress="http://map.naver.com/?dlevel=12&pinType=site&pinId=16893198&x=129.0785120&y=35.2368850&enc=b64"},
    new Building {ID=701, Name="제2사범관", Adrress="http://map.naver.com/?dlevel=12&pinType=site&pinId=16890863&x=129.0750250&y=35.2320350&enc=b64"},
    new Building {ID=702, Name="조소실", Adrress="http://map.naver.com/?dlevel=12&pinType=site&pinId=16890119&x=129.0761625&y=35.2333596&enc=b64"},
    new Building {ID=703, Name="미술관", Adrress="http://map.naver.com/?dlevel=12&pinType=site&pinId=16890119&x=129.0761625&y=35.2333596&enc=b64"},
    new Building {ID=704, Name="조형관", Adrress="http://map.naver.com/?dlevel=12&pinType=site&pinId=36061469&x=129.0759884&y=35.2325604&enc=b64"},
    new Building {ID=705, Name="경암체육관교수연구동", Adrress="http://map.naver.com/?dlevel=12&pinType=site&pinId=21489335&x=129.0745639&y=35.2330167&enc=b64"},
    new Building {ID=706, Name="경암체육관", Adrress="http://map.naver.com/?dlevel=14&pinType=site&pinId=16888381&x=129.0747071&y=35.2332808&enc=b64"},
    new Building {ID=707, Name="음악관", Adrress="http://map.naver.com/?dlevel=14&pinType=site&pinId=16892168&x=129.0761875&y=35.2342763&enc=b64"},
    new Building {ID=708, Name="학생회관", Adrress="http://map.naver.com/?dlevel=12&pinType=site&pinId=16890827&x=129.0763750&y=35.2353100&enc=b64"},
    new Building {ID=709, Name="과학기술연구동", Adrress="http://map.naver.com/?dlevel=12&pinType=site&pinId=16889023&x=129.0769901&y=35.2358163&enc=b64"},
    new Building {ID=710, Name="대운동장", Adrress="http://map.naver.com/?dlevel=12&pinType=site&pinId=16891092&x=129.0750250&y=35.2350096&enc=b64"},
    new Building {ID=711, Name="효원재", Adrress="http://map.naver.com/?dlevel=12&pinType=site&pinId=16890542&x=129.0763000&y=35.2363680&enc=b64"},
    new Building {ID=712, Name="웅비관A동", Adrress="http://map.naver.com/?dlevel=12&pinType=site&pinId=32022286&x=129.0771848&y=35.2367609&enc=b64"},
    new Building {ID=713, Name="웅비관B동", Adrress="http://map.naver.com/?dlevel=12&pinType=site&pinId=16893274&x=129.0768279&y=35.2372647&enc=b64"},
    new Building {ID=714, Name="진리관관리동", Adrress="http://map.naver.com/?dlevel=12&pinType=site&pinId=16889592&x=129.0777500&y=35.2375596&enc=b64"},
    new Building {ID=715, Name="진리관가동", Adrress="http://map.naver.com/?dlevel=12&pinType=site&pinId=16891296&x=129.0778000&y=35.2380760&enc=b64"},
    new Building {ID=716, Name="진리관나동", Adrress="http://map.naver.com/?dlevel=14&pinType=site&pinId=16890840&x=129.0773750&y=35.2380680&enc=b64"},
    new Building {ID=717, Name="진리관다동", Adrress="http://map.naver.com/?dlevel=12&pinType=site&pinId=16891557&x=129.0769630&y=35.2381260&enc=b64"}
};

        public async Task<HttpResponseMessage> Post([FromBody]Activity activity)
        {
            int buildingcount;
            int i = 0;

            buildingcount = buildings.Count;

            int searchnum = 0, correct = -1, str = 1;


            if (activity.Type == ActivityTypes.Message)
            {

                ConnectorClient connector = new ConnectorClient(new Uri(activity.ServiceUrl));
                // calculate something for us to return
                //int length = (activity.Text ?? string.Empty).Length;



                if (int.TryParse(activity.Text, out searchnum))
                {
                    str = 0;
                }


                if (str == 0) //숫자일떄
                {
                    for (i = 0; i < buildingcount; i++)
                    {
                        if (buildings[i].ID == searchnum)
                        {
                            correct = 1;
                            Activity reply = activity.CreateReply($"{buildings[i]}");
                            await connector.Conversations.ReplyToActivityAsync(reply);
                            break;
                            //linq가지고 찾기
                        }
                    }
                }
                else if (str == 1) //문자포함일때
                {
                    for (i = 0; i < buildingcount; i++)
                    {
                        if (buildings[i].Name.Contains(activity.Text))
                        //빌딩네임들에 엑티비티 텍스트가 포함되는지 검사
                        {//name.where
                            correct = 1;
                            Activity reply = activity.CreateReply($"{buildings[i]}");
                            await connector.Conversations.ReplyToActivityAsync(reply);
                        }
                    }
                }

                if (correct == -1)
                {
                    Activity reply = activity.CreateReply($"다시 입력해주세요\nex)건물이름or번호 도서관,화학,2사범관,705,514");
                    await connector.Conversations.ReplyToActivityAsync(reply);
                }


                // Activity reply = activity.CreateReply($"input: {activity.Text} which was {length} characters ");

            }
            else
            {
                await HandleSystemMessage(activity);
            }
            var response = Request.CreateResponse(HttpStatusCode.OK);
            return response;
        }

        private async Task<Activity> HandleSystemMessage(Activity message)
        {
            if (message.Type == ActivityTypes.DeleteUserData)
            {
                // Implement user deletion here
                // If we handle user deletion, return a real message
            }
            else if (message.Type == ActivityTypes.ConversationUpdate)
            {
                // Handle conversation state changes, like members being added and removed
                // Use Activity.MembersAdded and Activity.MembersRemoved and Activity.Action for info
                // Not available in all channels
                ConnectorClient connector = new ConnectorClient(new Uri(message.ServiceUrl));
                Activity reply = message.CreateReply($"안녕하세요 부산대학교 건물찾기 서비스입니다.\n찾는 건물이름이나 번호를 입력해주세요.\nEX)도서관,화학,2사범관,705,514");
                await connector.Conversations.ReplyToActivityAsync(reply);
            }
            else if (message.Type == ActivityTypes.ContactRelationUpdate)
            {
                // Handle add/remove from contact lists
                // Activity.From + Activity.Action represent what happened
            }
            else if (message.Type == ActivityTypes.Typing)
            {
                // Handle knowing tha the user is typing
            }
            else if (message.Type == ActivityTypes.Ping)
            {
            }

            return null;
        }
    }
}