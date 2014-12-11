using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;

namespace Mfly.CMS.MiddleTier.Service.CustomizedException
{
   public  class EntityRepeatedException:Exception
    {
        private string _errorMessage = string.Empty;

        public EntityRepeatedException()
        {
            _errorMessage = "Entity Repeated!";
        }

        public EntityRepeatedException(string errMsg)
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
