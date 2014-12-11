using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;

namespace Mfly.CMS.MiddleTier.Service.CustomizedException
{
   public  class EntityInUseException:Exception
    {
        private string _errorMessage = string.Empty;

        public EntityInUseException()
        {
            _errorMessage = "Entity In Use!";
        }

        public EntityInUseException(string errMsg)
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
