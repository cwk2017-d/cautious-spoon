<%@ page contentType="text/html;charset=UTF-8" language="java" isELIgnored="false" %>
<html>
<head>
    <title>添加岗位 - 智联招聘风格</title>
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css">
    <style>
        /* 全局样式 */
        * {
            margin: 0;
            padding: 0;
            box-sizing: border-box;
        }
        
        body {
            font-family: 'PingFang SC', 'Microsoft YaHei', Arial, sans-serif;
            line-height: 1.6;
            color: #333;
            background-color: #f5f7fa;
            margin: 0;
            padding: 0;
        }
        
        /* 顶部导航栏 - 智联招聘风格 */
        .top-nav {
            background-color: #fff;
            box-shadow: 0 2px 4px rgba(0,0,0,0.1);
            position: sticky;
            top: 0;
            z-index: 1000;
        }
        
        .nav-container {
            max-width: 1200px;
            margin: 0 auto;
            padding: 0 20px;
            display: flex;
            justify-content: space-between;
            align-items: center;
            height: 60px;
        }
        
        .logo {
            font-size: 24px;
            font-weight: bold;
            color: #00b38a;
            text-decoration: none;
            display: flex;
            align-items: center;
        }
        
        .logo i {
            margin-right: 8px;
        }
        
        .nav-menu {
            display: flex;
            list-style: none;
        }
        
        .nav-menu li {
            margin-left: 30px;
        }
        
        .nav-menu a {
            text-decoration: none;
            color: #333;
            font-size: 16px;
            transition: color 0.3s;
        }
        
        .nav-menu a:hover {
            color: #00b38a;
        }
        
        .user-area {
            display: flex;
            align-items: center;
        }
        
        .btn {
            display: inline-block;
            padding: 8px 20px;
            border: none;
            border-radius: 4px;
            font-size: 14px;
            font-weight: 500;
            cursor: pointer;
            transition: all 0.3s ease;
            text-decoration: none;
            text-align: center;
        }
        
        /* 主容器 */
        .container {
            max-width: 800px;
            margin: 30px auto;
            padding: 0 20px;
        }
        
        /* 表单容器 */
        .form-container {
            background: white;
            padding: 40px;
            border-radius: 8px;
            box-shadow: 0 2px 8px rgba(0,0,0,0.1);
            margin-bottom: 30px;
        }
        
        .form-header {
            margin-bottom: 30px;
            border-bottom: 2px solid #00b38a;
            padding-bottom: 15px;
        }
        
        .form-header h2 {
            color: #333;
            font-size: 22px;
            font-weight: 600;
            display: flex;
            align-items: center;
        }
        
        .form-header h2 i {
            margin-right: 10px;
            color: #00b38a;
        }
        
        /* 表单组 */
        .form-group {
            margin-bottom: 25px;
            position: relative;
        }
        
        .form-group label {
            display: block;
            margin-bottom: 8px;
            color: #666;
            font-weight: 500;
            font-size: 15px;
        }
        
        .form-group input[type="text"],
        .form-group input[type="date"],
        .form-group textarea {
            width: 100%;
            padding: 12px 16px;
            border: 1px solid #e0e0e0;
            border-radius: 4px;
            font-size: 16px;
            transition: all 0.3s ease;
            background-color: #fff;
        }
        
        .form-group input[type="text"]:focus,
        .form-group input[type="date"]:focus,
        .form-group textarea:focus {
            outline: none;
            border-color: #00b38a;
            box-shadow: 0 0 0 2px rgba(0, 179, 138, 0.1);
        }
        
        .form-group textarea {
            height: 150px;
            resize: vertical;
            font-family: inherit;
        }
        
        .form-group input::placeholder {
            color: #999;
        }
        
        /* 按钮样式 */
        .btn-submit {
            background-color: #00b38a;
            color: white;
            padding: 12px 36px;
            font-size: 16px;
            font-weight: 600;
            border-radius: 4px;
        }
        
        .btn-submit:hover {
            background-color: #009975;
            transform: translateY(-1px);
            box-shadow: 0 4px 8px rgba(0, 179, 138, 0.3);
        }
        
        .btn-back {
            background-color: #f5f5f5;
            color: #333;
            padding: 12px 36px;
            font-size: 16px;
            border: 1px solid #e0e0e0;
            border-radius: 4px;
            margin-left: 12px;
        }
        
        .btn-back:hover {
            background-color: #e8e8e8;
        }
        
        .btn:disabled {
            opacity: 0.6;
            cursor: not-allowed;
            transform: none;
            box-shadow: none;
        }
        
        /* 按钮组 */
        .button-group {
            display: flex;
            justify-content: flex-end;
            margin-top: 40px;
            gap: 12px;
            padding-top: 20px;
            border-top: 1px solid #f0f0f0;
        }
        
        /* 错误消息 */
        .error-message {
            color: #ff4d4f;
            margin-top: 8px;
            font-size: 14px;
            position: absolute;
            bottom: -24px;
            left: 0;
        }
        
        /* 必填标记 */
        .required {
            color: #ff4d4f;
            margin-left: 4px;
        }
        
        /* 表单提示 */
        .form-tips {
            background-color: #f0fdf4;
            border-left: 4px solid #00b38a;
            padding: 15px;
            margin-bottom: 25px;
            border-radius: 0 4px 4px 0;
            font-size: 14px;
            color: #166534;
        }
        
        .form-tips i {
            margin-right: 8px;
            color: #00b38a;
        }
        
        /* 响应式设计 */
        @media (max-width: 768px) {
            .nav-menu {
                display: none;
            }
            
            .button-group {
                flex-direction: column;
            }
            
            .btn-submit,
            .btn-back {
                width: 100%;
                margin-left: 0;
            }
            
            .btn-back {
                margin-left: 0;
                margin-top: 12px;
            }
            
            .form-container {
                padding: 25px;
            }
        }
        
        /* 动画效果 */
        @keyframes fadeIn {
            from {
                opacity: 0;
                transform: translateY(20px);
            }
            to {
                opacity: 1;
                transform: translateY(0);
            }
        }
        
        .fade-in {
            animation: fadeIn 0.5s ease-out;
            opacity: 0;
            animation-fill-mode: forwards;
        }
        
        .form-group:nth-child(1) {
            animation-delay: 0.1s;
        }
        
        .form-group:nth-child(2) {
            animation-delay: 0.2s;
        }
        
        .form-group:nth-child(3) {
            animation-delay: 0.3s;
        }
        
        .radio-group {
            display: flex;
            gap: 20px;
            margin-top: 10px;
        }
        
        .radio-item {
            display: flex;
            align-items: center;
            gap: 8px;
            cursor: pointer;
            padding: 8px 15px;
            border: 1px solid #d9d9d9;
            border-radius: 4px;
            transition: all 0.3s;
        }
        
        .radio-item:hover {
            border-color: #00b38a;
        }
        
        .radio-item input[type="radio"] {
            cursor: pointer;
        }
        
        .radio-item input[type="radio"]:checked + span {
            color: #00b38a;
            font-weight: 500;
        }
    </style>
</head>
<body>
    <!-- 顶部导航栏 -->
    <nav class="top-nav">
        <div class="nav-container">
            <a href="${pageContext.request.contextPath}/job/list" class="logo">
                <i class="fas fa-briefcase"></i> 智联招聘风格
            </a>
            <ul class="nav-menu">
                <li><a href="#">职位搜索</a></li>
                <li><a href="#">公司查询</a></li>
                <li><a href="#">求职攻略</a></li>
                <li><a href="#">薪资查询</a></li>
            </ul>
            <div class="user-area">
            <!-- 登录注册功能已移除 -->
        </div>
        </div>
    </nav>
    
    <div class="container">
        <div class="form-container fade-in">
            <div class="form-header">
                <h2><i class="fas fa-plus-circle"></i> 添加新岗位</h2>
            </div>
            
            <div class="form-tips">
                <i class="fas fa-lightbulb"></i> 请填写完整的岗位信息，带 <span class="required">*</span> 的字段为必填项
            </div>
            
            <form action="${pageContext.request.contextPath}/job/add" method="post" onsubmit="return validateForm()">
                <div class="form-group fade-in">
                    <label for="companyName">企业名称 <span class="required">*</span></label>
                    <input type="text" id="companyName" name="companyName" required placeholder="请输入企业全称">
                </div>
                
                <div class="form-group fade-in">
                    <label for="positionName">岗位名称 <span class="required">*</span></label>
                    <input type="text" id="positionName" name="positionName" required placeholder="请输入岗位名称">
                </div>
                
                <div class="form-group fade-in">
                    <label for="salary">薪资 <span class="required">*</span></label>
                    <input type="text" id="salary" name="salary" required placeholder="如：15k-25k">
                </div>
                
                <div class="form-group fade-in">
                    <label for="location">工作地点 <span class="required">*</span></label>
                    <input type="text" id="location" name="location" required placeholder="如：北京朝阳区">
                </div>
                
                <div class="form-group fade-in">
                    <label for="jobType">职位类型 <span class="required">*</span></label>
                    <div class="radio-group">
                        <label class="radio-item">
                            <input type="radio" name="jobType" value="全职" required> 全职
                        </label>
                        <label class="radio-item">
                            <input type="radio" name="jobType" value="兼职"> 兼职
                        </label>
                        <label class="radio-item">
                            <input type="radio" name="jobType" value="实习"> 实习
                        </label>
                    </div>
                </div>
            
            <div class="form-group fade-in">
                <label for="requirements">岗位要求 <span class="required">*</span></label>
                <textarea id="requirements" name="requirements" required placeholder="请输入岗位的具体要求，如技能要求、工作经验等"></textarea>
            </div>
            
            <input type="hidden" name="postTime" value="" id="postTime">
            
            <div class="button-group fade-in">
                <button type="submit" class="btn btn-submit">添加岗位</button>
                <a href="${pageContext.request.contextPath}/job/list" class="btn btn-back">返回列表</a>
            </div>
            

        </form>
    </div>
</div>

<script>
    // 设置当前时间作为发布时间
    document.addEventListener('DOMContentLoaded', function() {
        const now = new Date();
        const formattedDate = now.getFullYear() + '-' + 
                             String(now.getMonth() + 1).padStart(2, '0') + '-' + 
                             String(now.getDate()).padStart(2, '0') + ' ' + 
                             String(now.getHours()).padStart(2, '0') + ':' + 
                             String(now.getMinutes()).padStart(2, '0') + ':' + 
                             String(now.getSeconds()).padStart(2, '0');
        document.getElementById('postTime').value = formattedDate;
        
        // 添加表单元素的动画延迟
        const formGroups = document.querySelectorAll('.form-group');
        formGroups.forEach((group, index) => {
            group.style.animationDelay = (index * 0.1) + 's';
        });
    });
    
    // 表单验证函数
    function validateForm() {
        const companyName = document.getElementById('companyName').value.trim();
        const positionName = document.getElementById('positionName').value.trim();
        const salary = document.getElementById('salary').value.trim();
        const location = document.getElementById('location').value.trim();
        const requirements = document.getElementById('requirements').value.trim();
        
        // 基本验证
        if (!companyName) {
            alert('请输入企业名称');
            document.getElementById('companyName').focus();
            return false;
        }
        
        if (!positionName) {
            alert('请输入岗位名称');
            document.getElementById('positionName').focus();
            return false;
        }
        
        if (!salary) {
            alert('请输入薪资信息');
            document.getElementById('salary').focus();
            return false;
        }
        
        if (!location) {
            alert('请输入工作地点');
            document.getElementById('location').focus();
            return false;
        }
        
        if (!requirements) {
            alert('请输入岗位要求');
            document.getElementById('requirements').focus();
            return false;
        }
        
        // 薪资格式验证（简单的格式检查）
        const salaryPattern = /^[0-9]+k(-[0-9]+k)?$/;
        if (!salaryPattern.test(salary) && !salary.includes('元')) {
            if (!confirm('薪资格式可能不正确，建议使用"数字k"或"数字-数字k"格式。是否继续提交？')) {
                document.getElementById('salary').focus();
                return false;
            }
        }
        
        return true;
    }
    
    // 为输入框添加输入时的视觉反馈
    const inputs = document.querySelectorAll('input, textarea');
    inputs.forEach(input => {
        input.addEventListener('input', function() {
            if (this.value.trim()) {
                this.style.borderColor = '#10b981';
            } else {
                this.style.borderColor = '#e5e7eb';
            }
        });
    });
</script>
</body>
</html>