using Microsoft.Practices.EnterpriseLibrary.Data.Sql;
using Microsoft.Practices.EnterpriseLibrary.Common.Configuration;
using System.Configuration;

namespace Mfly.CMS.Utility
{
    public class EUDatabase : SqlDatabase
    {
        public EUDatabase()
            : base(ConfigurationManager.ConnectionStrings["connectionStrings"].ConnectionString)
        {
        }
    }
}
