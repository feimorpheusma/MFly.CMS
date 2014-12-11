using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Web.UI.WebControls;

namespace Mfly.CMS.Utility.WebControls
{
    public class GridViewObjectDataSource : ObjectDataSource
    {
        private ObjectDataSourceHelper _dataSourceHelper;

        public GridViewObjectDataSource(object dataSource, int virtualCount)
        {
            // 设置数据实体类型
            this.DataObjectTypeName = string.Empty;
            this.EnablePaging = true;
            this.EnableViewState = false;

            /// 设置分页需要的属性和方法
            this.TypeName = "Mfly.CMS.Utility.WebControls.ObjectDataSourceHelper";
            this.SelectMethod = "GetList";
            this.SelectCountMethod = "GetCount";
            this.StartRowIndexParameterName = "startRow";
            this.MaximumRowsParameterName = "maxRows";

            // 生成一个分页设配器s
            this._dataSourceHelper = new ObjectDataSourceHelper(dataSource, virtualCount);

            // 把已构造好的业分页设配器替换掉自身的数据源
            this.ObjectCreating += new ObjectDataSourceObjectEventHandler(ObjectDataSourceExtension_ObjectCreating);
        }

        protected void ObjectDataSourceExtension_ObjectCreating(object sender, ObjectDataSourceEventArgs e)
        {
            e.ObjectInstance = this._dataSourceHelper;
        }
    }

    public class ObjectDataSourceHelper
    {
        #region private variables
        private object _list;
        private int _count;
        #endregion

        #region public methods
        public ObjectDataSourceHelper(object list, int count)
        {
            _list = list;
            _count = count;
        }
        
        public object GetList()
        {
            return _list;
        }
        public object GetList(int startRow,int maxRows)
        {
            return _list;
        }

        public int GetCount()
        {
            return _count;
        }
        #endregion
    }
}
