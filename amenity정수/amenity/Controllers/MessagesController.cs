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

namespace Bot_Application2
{
    public class Amenity
    {
        public Amenity() { }

        // Properties.
        public string Name { get; set; }
        public string Adrress { get; set; }

        public override string ToString()
        {
            return Name + " " + Adrress;
        }
    }

    [BotAuthentication]
    public class MessagesController : ApiController
    {
        /// <summary>
        /// POST: api/Messages
        /// Receive a message from a user and reply to it
        /// </summary>

        int locationcount = 3;
        int i = 0;
        int correct = -1;
        string temp;
        List<Amenity> location = new List<Amenity>()
{
 
};
        public async Task<HttpResponseMessage> Post([FromBody]Activity activity)
        {
            if (activity.Type == ActivityTypes.Message)
            {

                ConnectorClient connector = new ConnectorClient(new Uri(activity.ServiceUrl));
                // calculate something for us to return
                //int length = (activity.Text ?? string.Empty).Length;


                temp = activity.Text;

                for (i = 0; i < locationcount; i++)
                {
                    if (location[i].Name == temp)
                    {
                        correct = i;
                        break;
                    }
                }

                if (correct != -1)
                {
                    Activity reply = activity.CreateReply($"{location[correct]}");
                    await connector.Conversations.ReplyToActivityAsync(reply);
                }
                else
                {
                    Activity reply1 = activity.CreateReply($"http://pnubot.azurewebsites.net/uPNU_homepage/kr/pages/campus_map.asp#");
                    await connector.Conversations.ReplyToActivityAsync(reply1);
                    
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
                Activity reply = message.CreateReply($"안녕하세요 부산대학교 편의시설 찾기 서비스입니다.\n http://pnubot.azurewebsites.net/uPNU_homepage/kr/pages/campus_map.asp  ");
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