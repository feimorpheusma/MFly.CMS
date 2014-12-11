<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="Search.ascx.cs" Inherits="Web.UserControls.Search" %>
<div class="search search_collection">
    <form name="search" action="/opus.html" method="get">
        <input type="hidden" name="is_all" id="is_all" value="0">
        <input type="hidden" name="hcs" value="1">
        <input type="text" name="search" class="ipt_text current change_bg" value="关键词" place="关键词" />
        <input type="text" name="author" class="ipt_text ipt_zz change_bg" value="作者" place="作者" />
        <div class="sel_pl xiala change_bg">
            <select name="clg" id="sel_pl" class="change_bg">
                <option value="0">品类</option>
                <option value="83" selected>中国画</option>
                <option value="89">齐白石精品</option>
            </select>
        </div>
        <input name="start" value="开始时间" id="inputDatestart" class="datetime timestart change_bg">
        <input name="end" value="结束时间" id="inputDateend" class="datetime timesover change_bg">
        <a href="javascript:;" class="btn_search" title="搜索" init="check"></a>
        <script>
            document.getElementById('inputDatestart').onclick = function () { WdatePicker() }
            document.getElementById('inputDateend').onclick = function () { WdatePicker() }
        </script>
    </form>
</div>
