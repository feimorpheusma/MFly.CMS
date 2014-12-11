using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;

namespace Mfly.CMS.MiddleTier.Service.CustomizedException
{
    public class EntityAlreadyProcessed : Exception
    {
        private string _errorMessage = string.Empty;

        public EntityAlreadyProcessed()
        {
            _errorMessage = "Entity is already processed!";
        }

        public EntityAlreadyProcessed(string errMsg)
        {
            _errorMessage = errMsg;
        }

        public override string Message
        {
            get
            {
                return _errorMessage;
            }
        }
    }
}
