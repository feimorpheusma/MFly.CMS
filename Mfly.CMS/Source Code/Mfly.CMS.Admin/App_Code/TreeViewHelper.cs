using System.Web.UI.WebControls;

namespace Mfly.CMS.Admin.App_Code
{
    public class TreeViewHelper
    { 
        public static void RemoveTreeNode(TreeView tv, string value)
        {
            TreeNode node = GetNodeByValue(tv, value);
            if (node != null)
            {
                node.Parent.ChildNodes.Remove(node);
            }
        }

        public static TreeNode GetNodeByValue(TreeView tv, string value)
        {
            TreeNode returnNode = null;
            foreach (TreeNode item in tv.Nodes)
            {
                if (item.Value == value)
                {
                    return item;
                }
                returnNode = getNodeByValue(item, value);
                if (returnNode != null)
                {
                    break;
                }
            }
            return returnNode;
        }

        private static TreeNode getNodeByValue(TreeNode node, string value)
        {
            if (node.Value == value) return node;
            foreach (TreeNode n in node.ChildNodes)
            {
                TreeNode n1 = getNodeByValue(n, value);
                if (n1 != null)
                {
                    return n1;
                }
            }
            return null;
        }
    }
}