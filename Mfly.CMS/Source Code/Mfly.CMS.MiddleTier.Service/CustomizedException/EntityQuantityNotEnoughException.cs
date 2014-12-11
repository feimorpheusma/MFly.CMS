using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;

namespace Mfly.CMS.MiddleTier.Service.CustomizedException
{
    public class EntityQuantityNotEnoughException : Exception
    {
        private string _errorMessage = string.Empty;

        public EntityQuantityNotEnoughException()
        {
            _errorMessage = "Entity Repeated!";
        }

        public EntityQuantityNotEnoughException(string errMsg)
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
