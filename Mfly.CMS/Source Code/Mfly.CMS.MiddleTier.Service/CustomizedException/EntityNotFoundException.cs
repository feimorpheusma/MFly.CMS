using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;

namespace Mfly.CMS.MiddleTier.Service.CustomizedException
{
    public class EntityNotFoundException : Exception
    {
        private string _errorMessage = string.Empty;

        public EntityNotFoundException()
        {
            _errorMessage = "Entity not found!";
        }

        public EntityNotFoundException(string errMsg)
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
