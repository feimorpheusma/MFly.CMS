using System.ComponentModel;

namespace Mfly.CMS.MiddleTier.Model
{
    /// <summary>
    /// 帖子状态
    /// </summary>
    public enum PostStatusEnum
    {
        /// <summary>
        /// 未结贴
        /// </summary>
        Open = 1,

        /// <summary>
        /// 已结贴
        /// </summary>
        Close = 2,
    }

    /// <summary>
    /// 排序状态
    /// </summary>
    public enum PostOrderStatusEnum
    {
        /// <summary>
        /// 普通
        /// </summary>
        Ordinary = 1,

        /// <summary>
        /// 置顶
        /// </summary>
        Top = 2,

        /// <summary>
        /// 精华
        /// </summary>
        Digest = 3,
    }

    /// <summary>
    /// 评论状态
    /// </summary>
    public enum PostReplyStatusEnum
    {
        /// <summary>
        /// 合法
        /// </summary>
        Legitimate = 1,

        /// <summary>
        /// 非法(禁止显示)
        /// </summary>
        Illegal = 2,
    }

    /// <summary>
    /// 操作
    /// </summary>
    public enum OperationEnum
    {
        /// <summary>
        /// 操作成功
        /// </summary>
        RET_OK = 0,

        /// <summary>
        /// 操作失败
        /// </summary>
        RET_ENTITYNOTFOUND = -1,

        /// <summary>
        /// 正在使用
        /// </summary>
        RET_ENTITYINUSE = -2,

        /// <summary>
        /// 存在重复
        /// </summary>
        RET_ENTITYREPEATED = -3,

        /// <summary>
        /// 库存量不足
        /// </summary>
        RET_QUANTITYNOTENOUGH = -4,
    }

    /// <summary>
    /// 登陆用户类型
    /// </summary>
    public enum UserTypeEnum
    {
        /// <summary>
        /// 所有
        /// </summary>
        [Description("所有")]
        Unspecified = 0,

        /// <summary>
        /// 管理员
        /// </summary>
        [Description("管理员")]
        Admin = 1,

        /// <summary>
        /// 普通用户
        /// </summary>
        [Description("普通用户")]
        Normal = 2,

        /// <summary>
        /// 讲师
        /// </summary>
        [Description("讲师")]
        Teacher = 3
    }

    public enum UserStatusEnum
    {
        /// <summary>
        /// 所有
        /// </summary>
        [Description("所有")]
        Unspecified = 0,

        /// <summary>
        /// 活动
        /// </summary>
        [Description("活动")]
        Active = 1,

        /// <summary>
        /// 锁定
        /// </summary>
        [Description("禁止")]
        Locked = 2
    }

    /// <summary>
    /// 性别
    /// </summary>
    public enum GendTypeEnum
    {
        /// <summary>
        /// 保密
        /// </summary>
        [Description("保密")]
        Unspecified = 0,

        /// <summary>
        /// Male
        /// </summary>
        [Description("男")]
        Male = 1,

        /// <summary>
        /// Female
        /// </summary>
        [Description("女")]
        Female = 2
    }

    public enum ErrorCodeEnum
    {
        /// <summary>
        /// 此记录不存在
        /// </summary>
        [Description("此记录不存在")]
        UnExistsRecord = 1,

        /// <summary>
        /// 非法操作
        /// </summary>
        [Description("非法操作")]
        UnLegal = 2,

        /// <summary>
        /// 非法操作
        /// </summary>
        [Description("没有权限")]
        UnAuthorization = 3,
    }

    public enum ArticleTypeEnum
    {
        /// <summary>
        /// 未指定
        /// </summary>
        [Description("未指定")]
        Unspecified = 0,


        [Description("作家")]
        Author = 1,

        [Description("作品集")]
        Collections = 2,

        [Description("文章")]
        Article = 3,

    }

    public enum ImageTypeEnum
    {
        /// <summary>
        /// 未指定
        /// </summary>
        [Description("未指定")]
        Unspecified = 0,

        /// <summary>
        /// 默认图片
        /// </summary>
        [Description("默认图片")]
        DefaultPicture = 1,

        [Description("作品图片")]
        AuthorPicture = 2,

    }

    public enum UserAuditEnum
    {
        /// <summary>
        /// 未审批
        /// </summary>
        [Description("未审批")]
        UnAudited = 0,

        /// <summary>
        /// 已审批
        /// </summary>
        [Description("已审批")]
        Audited = 1,
    }
    public enum MenuLevelEnum
    {
        /// <summary>
        /// 一级
        /// </summary>
        [Description("一级")]
        First = 1,

        /// <summary>
        /// 二级
        /// </summary>
        [Description("二级")]
        Second = 2,
    }
    public enum MenuTypeEnum
    {
        /// <summary>
        /// 首页
        /// </summary>
        [Description("首页")]
        Index = 0,

        /// <summary>
        /// 列表
        /// </summary>
        [Description("列表")]
        List = 1,

        /// <summary>
        /// 详细
        /// </summary>
        [Description("详细")]
        Detail = 2,

        /// <summary>
        /// 图片列表
        /// </summary>
        [Description("图片列表")]
        ImageList = 3,
    }
}

