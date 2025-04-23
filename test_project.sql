/*
 Navicat Premium Data Transfer

 Source Server         : web_demo1
 Source Server Type    : MySQL
 Source Server Version : 80034 (8.0.34)
 Source Host           : localhost:3306
 Source Schema         : test_project

 Target Server Type    : MySQL
 Target Server Version : 80034 (8.0.34)
 File Encoding         : 65001

 Date: 16/04/2025 21:49:55
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for academic_search_tool
-- ----------------------------
DROP TABLE IF EXISTS `academic_search_tool`;
CREATE TABLE `academic_search_tool`  (
  `id` int NOT NULL AUTO_INCREMENT,
  `icon` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '图标URL',
  `name` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '网站名称',
  `description` text CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL COMMENT '网站描述',
  `url` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '网站链接',
  `is_free` tinyint(1) NULL DEFAULT 1 COMMENT '是否免费:0-付费,1-免费',
  `create_time` datetime NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `update_time` datetime NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 21 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci COMMENT = '学术资源检索网站表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of academic_search_tool
-- ----------------------------
INSERT INTO `academic_search_tool` VALUES (1, '/files/20250331/65a424f8311a471aad77f0ca407b80a2.jpg', '中国知网', '中国知网（CNKI）是中国最大的学术文献数据库，涵盖期刊、博硕士论文、会议论文等资源，覆盖自然科学、社会科学、医学等多个学科。数据每日更新，支持跨库检索，是国内学术研究的重要工具。', 'https://www.cnki.net', 1, '2025-03-31 20:42:27', '2025-03-31 20:42:27');
INSERT INTO `academic_search_tool` VALUES (2, '/files/20250401/f52af39554e443c19572cdf765f53fd1.jpg', 'IEEE Xplore', 'IEEE Xplore是一个学术文献数据库，主要提供计算机科学、电机工程学和电子学等相关领域文献的索引、摘要以及全文下载服务。它基本覆盖了电气电子工程师学会和国际工程技术学会的文献资料，收录了超过2百万份文献。', 'https://ieeexplore.ieee.org/Xplore/home.jsp', 1, '2025-04-01 16:35:30', '2025-04-01 16:35:30');
INSERT INTO `academic_search_tool` VALUES (3, '/files/20250401/a6e831d2a7c84a4fb5b79f49ddfc36bd.png', '谷歌学术', '借助 Google 学术搜索，您可以轻松地大范围搜索学术文献。搜索范围囊括众多知识领域和来源：文章、论文、图书、摘要和法院判决意见书。', 'https://scholar.google.com.hk/?hl=zh-CN', 1, '2025-04-01 16:37:45', '2025-04-01 16:37:45');
INSERT INTO `academic_search_tool` VALUES (4, '/files/20250401/25b326bd46814cbcb12de9c5e8f87ae1.jpg', 'arXiv', 'arXiv是一个面向全球科学家和研究人员的开放获取预印本网站，主要收录物理学、数学、计算机科学、生物学、定量金融学、统计学等多个学科领域的论文预印本。 该平台自1991年8月创立以来，逐步发展成为公认最成功的开放获取数字系统之一。', 'https://arxiv.org/', 1, '2025-04-01 16:40:05', '2025-04-01 16:40:05');
INSERT INTO `academic_search_tool` VALUES (5, '/files/20250401/019bd9e42c70477297e7aecc1ab6083c.png', '万方数据知识服务平台', '万方数据知识服务平台是由北京万方数据股份有限公司创立的数字内容出版平台，是与中国知网、维普资讯并列的中国大陆地区三大学术资源数据库。', 'https://www.wanfangdata.com.cn/', 1, '2025-04-01 16:42:01', '2025-04-01 16:42:01');
INSERT INTO `academic_search_tool` VALUES (6, '/files/20250401/3129ab902f7e4ee2a33ae52d6a324822.png', '维普资讯', '维普中文期刊服务平台，由维普资讯有限公司出品，通过对国内出版发行的14000余种科技期刊、5600万篇期刊全文进行内容分析和引文分析，为专业用户提供一站式文献服务', 'https://qikan.cqvip.com/', 1, '2025-04-01 16:45:07', '2025-04-01 16:45:07');
INSERT INTO `academic_search_tool` VALUES (7, '/files/20250401/2ef83a030bc84f0b83ef1f55f13f557d.png', '维普智立方', '维普智立方是一个整合了期刊、学位论文、会议论文、专利等十种类型文献的大数据知识服务平台，提供各种检索、分析、挖掘和全文保障的服务。', 'https://zlf.cqvip.com/index.aspx', 1, '2025-04-01 16:47:11', '2025-04-01 16:47:11');
INSERT INTO `academic_search_tool` VALUES (8, '/files/20250401/6907b9e55347400093ad5797056ab312.png', '中国学术文献数据库', '中国学术文献数据库》是一个集学术期刊论文、学位论文、会议论文、报纸、图书等多种学术文献资源于一体的综合性数据库公益平台，涵盖了广泛的学科和领域。', 'https://www.xueshuwenxian.com/', 1, '2025-04-01 16:49:25', '2025-04-01 16:49:25');
INSERT INTO `academic_search_tool` VALUES (9, '/files/20250401/8ae08515f25444fd9de6ca2bc717fcb3.png', '国家哲学社会科学文献中心', '国家哲学社会科学文献中心”立足全国哲学社会科学领域，由国家投入和支持，开展哲学社会科学文献信息资源建设和服务。 ', 'https://www.ncpssd.cn/', 1, '2025-04-01 16:52:11', '2025-04-01 16:52:11');
INSERT INTO `academic_search_tool` VALUES (10, '/files/20250401/475134f66439475fb0c96e37e48d8b72.png', '小鲸鱼文献', '是一个学术类导航网站，提供了一些sci-hub，Google学术等文献下载相关网站。网站还有科研领路人的专栏导航，非常方便。', 'http://www.9312.net/', 1, '2025-04-01 16:55:11', '2025-04-01 16:55:11');
INSERT INTO `academic_search_tool` VALUES (11, '/files/20250401/67679a6532c0414c837aa8115b823c3d.png', '思谋学术', '思谋网是一个科研学习服务平台，提供Google学术搜索及文献资源导航服务，可免费搜索学术文章和论文。思谋学术（https://ac.scmor.com）是思谋网的一个子域名。', 'https://ac.scmor.com/', 1, '2025-04-01 16:57:19', '2025-04-01 16:57:19');
INSERT INTO `academic_search_tool` VALUES (12, '/files/20250401/797ce97b2bb14975ab293ed04de72743.jpg', '百度学术', '百度学术（https://xueshu.baidu.com）于2014年6月上线，是百度旗下的免费学术资源搜索平台，致力于将资源检索技术和大数据挖掘分析能力贡献于学术研究。', 'https://xueshu.baidu.com/', 1, '2025-04-01 16:59:01', '2025-04-01 16:59:01');
INSERT INTO `academic_search_tool` VALUES (13, '/files/20250401/db91003c86874e5d8779e264c5ceeb30.jpg', 'SciHub学术导航', 'Sci-Hub科研学术导航,汇集文献检索、论文查重、期刊发表、写作降重，免费下载中外文文献、电子图书、专利等，为广大科研人员在学术道路上提供方便快捷的服务！', 'https://www.scihub.net.cn/', 1, '2025-04-01 17:01:40', '2025-04-01 17:01:40');
INSERT INTO `academic_search_tool` VALUES (14, '/files/20250401/ea5a474d37ef4c5c9d9c52ad1a98142c.jpg', 'sci-hub', 'Sci-hub是一个提供学术文献免费获取的网站。它收录了大量的学术文献，涵盖了自然科学、工程技术，社会科学、人文艺术等各个学科领域.', 'https://scihub.ruanmao.net/', 1, '2025-04-01 17:03:25', '2025-04-01 17:03:25');
INSERT INTO `academic_search_tool` VALUES (15, '/files/20250401/72edf4a5d1224ad980be432045b086a3.jpg', 'Web of Science', 'Web of Science 是一个首屈一指的研究平台，提供跨学科的全面科学数据、引文分析和见解。', 'https://www.webofscience.com/wos', 1, '2025-04-01 17:05:51', '2025-04-01 17:05:51');
INSERT INTO `academic_search_tool` VALUES (16, '/files/20250401/e47d840a89cb47619d9a78c92c4a3241.jpg', '必应学术', 'Microsoft Academic 是一个平台，旨在探索如何通过利用机器在内存、计算、传感等方面的认知能力来帮助人类进行科学研究。', 'https://www.microsoft.com/en-us/research/project/academic/', 1, '2025-04-01 17:08:37', '2025-04-01 17:08:37');
INSERT INTO `academic_search_tool` VALUES (17, '/files/20250401/d0334e0c608b412e9c697b5d33bd3115.png', 'PubScholar公益学术平台', 'PubScholar公益学术平台是中国科学院作为国家战略科技力量的主力军，履行学术资源保障“国家队”职责，为满足全国科技界和全社会科技创新的学术资源基础保障需求。', 'https://pubscholar.cn/explore', 1, '2025-04-01 17:10:33', '2025-04-01 17:10:33');
INSERT INTO `academic_search_tool` VALUES (18, '/files/20250401/5ff7c8066a20435db56885aa171e0061.jpg', 'PubMed', 'PubMed是主要用于检索MEDLINE数据库中，生命科学和生物医学引用文献及索引的免费搜索引擎。本系统属于美国国立卫生研究院下属的国家医学图书馆维护的Entrez信息检索系统的一部分。', 'https://pubmed.ncbi.nlm.nih.gov/', 1, '2025-04-01 17:12:57', '2025-04-01 17:12:57');
INSERT INTO `academic_search_tool` VALUES (19, '/files/20250401/66a42c7adfc144099effd2b346b7bc3d.png', '虫部落学术搜索', '虫部落出品了好几个类似的集合型搜索引擎，质量都很不错。这个学术搜索包含了常用的各种学术搜索引擎入口，再也不用把各种搜索网站堆在收藏夹里啦.', 'https://scholar.chongbuluo.com/', 1, '2025-04-01 17:14:59', '2025-04-01 17:14:59');
INSERT INTO `academic_search_tool` VALUES (20, '/files/20250401/91994dba36bd4d8192ab19a89aee6635.png', '小白学术', '以出版人文社科领域学术著作而著名，特别是在语言学、翻译学与口译研究、文学研究等学术出版领域，全面致力于为全球学术界提供最具深度与研究价值的学术资料，', 'https://www.sssam.com/', 1, '2025-04-01 17:18:44', '2025-04-01 17:18:44');

-- ----------------------------
-- Table structure for admin
-- ----------------------------
DROP TABLE IF EXISTS `admin`;
CREATE TABLE `admin`  (
  `id` int NOT NULL AUTO_INCREMENT COMMENT '主键ID',
  `avatar` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '头像',
  `username` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '用户名',
  `password` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '密码',
  `email` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '邮箱',
  `role` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT 'admin' COMMENT '角色',
  `status` tinyint(1) NULL DEFAULT 1 COMMENT '状态（0：禁用，1：启用）',
  `create_time` datetime NULL DEFAULT NULL COMMENT '创建时间',
  `update_time` datetime NULL DEFAULT NULL COMMENT '更新时间',
  `last_login_time` datetime NULL DEFAULT NULL COMMENT '最后登录时间',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `uk_username`(`username` ASC) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 3 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci COMMENT = '管理员表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of admin
-- ----------------------------
INSERT INTO `admin` VALUES (1, NULL, 'admin', 'e10adc3949ba59abbe56e057f20f883e', 'admin@gmail.com', 'admin', 1, '2025-04-09 15:11:57', '2025-04-09 15:36:23', '2025-04-15 20:09:18');
INSERT INTO `admin` VALUES (2, '/files/20250411/48dda67788ed4133a3ce0cf57e76737f.png', 'mizhuo', 'e10adc3949ba59abbe56e057f20f883e', 'mixiongwudi123@gmail.com', 'admin', 1, '2025-04-09 17:00:37', '2025-04-11 17:05:56', '2025-04-16 17:15:17');

-- ----------------------------
-- Table structure for ai_coding_tools
-- ----------------------------
DROP TABLE IF EXISTS `ai_coding_tools`;
CREATE TABLE `ai_coding_tools`  (
  `id` int NOT NULL AUTO_INCREMENT,
  `icon` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '工具图标',
  `name` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '工具名称',
  `description` text CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL COMMENT '工具描述',
  `url` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '工具链接',
  `language` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '支持的编程语言',
  `create_time` datetime NULL DEFAULT NULL COMMENT '创建时间',
  `update_time` datetime NULL DEFAULT NULL COMMENT '更新时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 22 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci COMMENT = 'AI编程辅助工具' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of ai_coding_tools
-- ----------------------------
INSERT INTO `ai_coding_tools` VALUES (3, 'http://localhost:9090/files/20250329/16285a5d771e42aa82312442902448df.png', 'Cursor', 'Cursor 是一款基于AI的智能代码编辑器，支持自然语言交互生成、优化代码，适用于Python、Java、JavaScript等多种语言，主打高效编程与上下文理解。', 'https://www.cursor.com/', 'Python、Java、JavaScript等', '2025-03-29 16:49:53', '2025-03-29 16:51:55');
INSERT INTO `ai_coding_tools` VALUES (4, 'http://localhost:9090/files/20250330/5cce86702b5d4b11b2ea5e2d6810f83e.jpg', 'Trae', 'Trae 是字节跳动推出的 AI原生集成开发环境（IDE），深度集成AI能力，支持自然语言交互、代码自动补全、多模态开发等功能，适配专业开发者与非技术用户。Builder 模式可通过自然语言描述（如“开发带登录功能的论坛”），自动拆解任务并生成完整代码框架39。支持上传图片（如设计草图）生成代码，或解析错误截图提供修复建议。', 'https://www.trae.ai', 'Java,Python,JavaScript等等', '2025-03-30 11:45:56', '2025-03-30 11:45:56');
INSERT INTO `ai_coding_tools` VALUES (5, 'http://localhost:9090/files/20250330/2497bb7aeca940a3818fa90a92bf484b.png', 'V0.dev', 'V0.dev 是由 Vercel 推出的 AI 驱动的前端 UI 生成工具，用户只需输入自然语言描述或上传设计图，即可快速生成 React、Vue、Svelte 等框架的代码，并支持 Tailwind CSS 和 shadcn/ui 样式库，大幅提升开发效率。', 'https://v0.dev/', 'React、Vue、Svelte等', '2025-03-30 15:23:26', '2025-03-30 15:23:26');
INSERT INTO `ai_coding_tools` VALUES (6, 'http://localhost:9090/files/20250330/2076742f3b5241f4a4ffaea31d595d91.png', 'Bolt.new', 'Bolt.new 是 StackBlitz 推出的 AI 驱动的全栈 Web 开发平台，基于 WebContainers 技术，允许用户在浏览器中直接完成从代码生成到部署的全流程，无需本地环境配置。', 'https://bolt.new/', '内置 Node.js、npm、Vite、Next.js 等', '2025-03-30 15:25:32', '2025-03-30 15:25:32');
INSERT INTO `ai_coding_tools` VALUES (7, 'http://localhost:9090/files/20250330/4e90de14e67d4416841846ccae65bc1d.png', 'Devin', 'Devin 是由 Cognition Labs 开发的全球首个 AI 程序员，具备自主编写代码、调试、部署应用及学习新技术的能力，旨在辅助或部分替代传统软件开发工作.', 'https://cognition.ai/', '所有编程语言', '2025-03-30 15:27:42', '2025-03-30 15:27:42');
INSERT INTO `ai_coding_tools` VALUES (8, 'http://localhost:9090/files/20250330/06e2b1b4fc40414ab8d3c43309d4094c.png', '通义灵码', '通义灵码 是阿里云推出的 AI 智能编码助手，基于 通义大模型 研发，提供 代码生成、智能问答、单元测试、代码优化 等功能，支持 Java、Python、Go、C++ 等 200+ 编程语言，适配 VS Code、JetBrains IDEs 等主流开发工具。', 'https://lingma.aliyun.com/lingma', '支持 Java、Python、Go、C++ 等 200+ 编程语言', '2025-03-30 15:30:07', '2025-03-30 15:30:07');
INSERT INTO `ai_coding_tools` VALUES (9, 'http://localhost:9090/files/20250330/dc7863e1dd1b46dea30fbd4872876100.png', '豆包MarsCode', 'MarsCode 是 字节跳动旗下豆包团队 推出的 AI 编程助手，提供智能代码补全、生成、优化等功能，支持 200+ 编程语言 及主流 IDE（如 VS Code、JetBrains 系列），旨在提升开发效率与代码质量.', 'https://www.marscode.cn/', '支持 200+ 编程语言', '2025-03-30 15:32:13', '2025-03-30 15:32:13');
INSERT INTO `ai_coding_tools` VALUES (10, 'http://localhost:9090/files/20250330/60de8bfb40ee4463b64e92e185db6353.png', 'Amazon CodeWhisperer ', 'Amazon CodeWhisperer 是亚马逊推出的 AI 编程助手，基于数十亿行代码训练，提供 实时代码生成、安全扫描 等功能，个人开发者可免费使用，支持 15 种编程语言 并兼容主流 IDE（如 VS Code、JetBrains 系列）', 'https://aws.amazon.com/codewhisperer', '支持 Python/Java/JavaScript', '2025-03-30 15:34:39', '2025-03-30 15:34:39');
INSERT INTO `ai_coding_tools` VALUES (11, 'http://localhost:9090/files/20250330/91b48cbe725f4a228919c0f3ec09375d.jpg', 'Codeium', 'Codeium 是一款 免费 的 AI 编程助手，支持 70+ 编程语言（如 Python、Java、JavaScript、C++ 等），并兼容 40+ 主流 IDE（如 VS Code、JetBrains 系列、Vim、Jupyter 等），提供 代码补全、生成、优化、测试 等功能，帮助开发者提升效率', 'https://codeium.com', 'Python、Java、JavaScript、C++ 等', '2025-03-30 15:36:48', '2025-03-30 15:36:48');
INSERT INTO `ai_coding_tools` VALUES (12, 'http://localhost:9090/files/20250330/0a8c5ebb4af343228403ff0423cf4293.png', 'iFlyCode', 'iFlyCode 是 科大讯飞 推出的 AI 智能编程助手，基于 讯飞星火认知大模型，支持 代码生成、补全、解释、纠错、单元测试 等功能，兼容 VS Code、JetBrains 系列 等主流 IDE，助力开发者提升效率。', 'https://iflycode.xfyun.cn/', 'Python、Java、JavaScript、C++、SQL 等', '2025-03-30 15:38:20', '2025-03-30 15:38:20');
INSERT INTO `ai_coding_tools` VALUES (13, 'http://localhost:9090/files/20250330/e112b9cb86f142328f8f4002f7cb6e91.png', 'Windsurf', 'Windsurf 是由 Codeium 团队开发的 下一代 AI 编程助手，采用独特的 AI Flow 范式，深度整合 智能代理（Agent）与 Copilot 协作，提供 上下文感知、多文件编辑、自然语言命令执行 等功能，旨在提升开发者的效率和流畅度.', 'https://codeium.com/windsurf', '兼容 70+ 编程语言（Python、Java 等）', '2025-03-30 15:41:20', '2025-03-30 15:41:20');
INSERT INTO `ai_coding_tools` VALUES (14, 'http://localhost:9090/files/20250330/15e8497f3a0f430fb44091b1acd59ffb.jpg', '代码小浣熊', '代码小浣熊 是 商汤科技 推出的 AI 智能编程助手，基于 商汤日日新（SenseNova）大模型，支持 90+ 主流编程语言（如 Python、Java、JavaScript、C++、Go、SQL 等），并兼容 VS Code、IntelliJ IDEA 等主流 IDE，旨在提升开发者的编程效率与代码质量。', 'https://xiaohuanxiong.com/', '支持 90+ 主流编程语言', '2025-03-30 15:43:16', '2025-03-30 15:43:16');
INSERT INTO `ai_coding_tools` VALUES (15, 'http://localhost:9090/files/20250330/4245fdf8a02a403b80e46cb2095ba376.jpg', 'MetaGPT X', 'MetaGPT 是一个基于 多智能体协作 的 元编程框架，通过 标准作业程序（SOP） 协调多个 大语言模型（LLM） 智能体，模拟 软件开发团队 的完整流程，实现从 需求输入 到 代码生成 的自动化。', 'https://mgx.dev/', '支持 Python、Java、JavaScript 等多种语言', '2025-03-30 15:45:42', '2025-04-07 17:21:17');
INSERT INTO `ai_coding_tools` VALUES (16, 'http://localhost:9090/files/20250330/b1d8bb0eadb143bda9d7d3bdd9c04717.png', 'CodeArts Snap', 'CodeArts Snap 是 华为云 推出的 AI 智能编程助手，基于 盘古大模型（PanGu-Coder） 开发，支持 Python、Java 等语言，兼容 VS Code、JetBrains 系列 IDE（如 PyCharm、IntelliJ），提供 代码生成、智能问答、单元测试、代码优化 等全场景开发辅助功能，旨在提升开发者效率与代码质量.', 'https://www.huaweicloud.com/product/codeartside/snap.html', '支持 Python、Java 等语言', '2025-03-30 15:47:55', '2025-03-30 15:47:55');
INSERT INTO `ai_coding_tools` VALUES (17, 'http://localhost:9090/files/20250330/b45009a4f191430781dd5695e623fbfb.png', 'Lovable', 'Lovable 是瑞典 AI 初创公司推出的一款 革命性 AI 编程工具，旨在让 非技术人员也能轻松开发应用程序，仅需 自然语言描述 即可生成 全栈 Web 应用，大幅降低软件开发门槛。', 'https://lovable.dev', '专注 React/Typescript + Supabase', '2025-03-30 15:51:26', '2025-03-30 15:51:26');
INSERT INTO `ai_coding_tools` VALUES (18, 'http://localhost:9090/files/20250330/bcac032529484d219d6c401d5fa54b07.png', 'Solo AI', 'Solo AI 是 Mozilla（火狐浏览器开发商）推出的 零代码 AI 网站生成工具，专为 个体企业家、自由职业者和小型企业 设计，用户无需编程经验即可通过自然语言快速创建专业网站。', 'https://soloist.ai/', '未知', '2025-03-30 15:53:31', '2025-03-30 15:53:31');
INSERT INTO `ai_coding_tools` VALUES (19, 'http://localhost:9090/files/20250330/28c16dfe057442449501bcc5e1386ecb.png', 'Github Copilot', 'GitHub Copilot 是 GitHub 与 OpenAI 联合推出的 AI 编程助手，基于 GPT 大模型 开发，能够通过分析上下文代码和注释，实时生成代码建议，支持 多种编程语言 和 主流开发环境。', 'https://github.com/features/copilot', '多种编程语言 ', '2025-03-30 15:55:39', '2025-03-30 15:55:39');
INSERT INTO `ai_coding_tools` VALUES (20, 'http://localhost:9090/files/20250330/071d922b6b2447188dffeac959033519.png', 'Replit Agent', 'Replit Agent 是 Replit 公司推出的 AI 编程助手，旨在通过自然语言交互简化应用开发流程，让 零基础用户也能快速构建软件项目。', 'https://docs.replit.com/replitai/agent', '主流编程语言', '2025-03-30 15:58:56', '2025-03-30 15:58:56');
INSERT INTO `ai_coding_tools` VALUES (21, 'http://localhost:9090/files/20250401/f46f31fe5e564732b6fa4722ffb6e0a8.png', 'CerebrasCoder', '在不到一秒的时间内将您的想法转化为功能齐全的应用程序 - 由 Cerebras 超高速晶圆芯片上的 Llama3.3-70b 提供支持。代码是 100% 开源的，托管在 Val Town 上。', 'https://cerebrascoder.com/', '主流编程语言', '2025-04-01 16:31:10', '2025-04-01 16:31:10');

-- ----------------------------
-- Table structure for ai_mindmap_tools
-- ----------------------------
DROP TABLE IF EXISTS `ai_mindmap_tools`;
CREATE TABLE `ai_mindmap_tools`  (
  `id` int NOT NULL AUTO_INCREMENT,
  `icon` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '图标URL',
  `name` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '工具名称',
  `description` text CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL COMMENT '工具描述',
  `url` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '官网链接',
  `is_free` tinyint(1) NULL DEFAULT 0 COMMENT '是否免费',
  `create_time` datetime NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `update_time` datetime NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 15 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci COMMENT = 'AI思维导图工具表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of ai_mindmap_tools
-- ----------------------------
INSERT INTO `ai_mindmap_tools` VALUES (1, 'http://localhost:9090/files/20250406/a4c7f5ecb38b4224b7dee829d2641c60.png', 'TreeMind树图', 'TreeMind树图思维导图，一个创新的在线思维导图编辑器。 用户友好、功能强大，是理想的创意思维工具，助您轻松规划项目、整理思路和促进团队协作。', 'https://shutu.cn/', 1, '2025-04-06 16:44:28', '2025-04-06 16:44:28');
INSERT INTO `ai_mindmap_tools` VALUES (2, 'http://localhost:9090/files/20250406/d16c66d4d449442fafc6c31f6684ae1d.png', 'boardmix在线协作白板', 'boardmix在线协作白板，集自由布局、画笔、便签、多媒体呈现、脑图、文档多种创意表达能力于一体，激发团队创造力无限延伸。', 'https://boardmix.cn/', 1, '2025-04-06 16:46:21', '2025-04-06 16:46:21');
INSERT INTO `ai_mindmap_tools` VALUES (3, 'http://localhost:9090/files/20250406/9c4b7bf8d3e2460cb8086ad854d944fb.png', 'ProcessOn', 'ProcessOn是一款专业的在线流程图工具，支持23种图形种类，提供AI流程图能力，支持多人协作和多种格式导入导出。ProcessOn还有海量流程图模板.', 'https://www.processon.com/', 1, '2025-04-06 16:47:51', '2025-04-06 16:47:56');
INSERT INTO `ai_mindmap_tools` VALUES (4, 'http://localhost:9090/files/20250406/6b87048a08814e598a04d81df76798e1.png', 'GitMind', 'GitMind是一款新一代AI智能思维导图协作软件，可以帮助用户创建、分享、协作各种思维分型，如思维导图、流程图、组织结构图等。', 'https://gitmind.cn/', 1, '2025-04-06 16:50:01', '2025-04-06 16:50:01');
INSERT INTO `ai_mindmap_tools` VALUES (5, 'http://localhost:9090/files/20250406/ba7365bf4c664a9683c5bd66aff3205a.png', 'Whimsical', 'Whimsical 是一个用于任务、文档和通信的集成项目空间。下载适用于 macOS 的桌面应用程序，从容不迫地工作，不受干扰，并访问模板、博客、客户和帮助中心。', 'https://whimsical.com/', 1, '2025-04-06 16:52:37', '2025-04-06 16:52:44');
INSERT INTO `ai_mindmap_tools` VALUES (6, 'http://localhost:9090/files/20250406/0062ee3dee2f4cb3bc3b73b84e4448d3.png', '印象图记', '印象图记为您提供多种实用主题和精美图标，一键美化思维导图 小白轻松上手，创造极具个人风格的思维导图 海量模板选择，激发无限灵感', 'https://www.yinxiang.com/product/evermind-baidu/', 1, '2025-04-06 16:55:05', '2025-04-06 16:55:05');
INSERT INTO `ai_mindmap_tools` VALUES (7, 'http://localhost:9090/files/20250406/f6df1e5974b54c129850ef116459f147.png', '知犀AI（swdt.com）', '知犀AI（swdt.com），是一款GPT人工智能Ai思维导图工具，输入一句话即可一键生成思维导图，助您头脑风暴、高效捕捉灵感，并自动拓展脑图或生成文章，显著提高学习效率', 'https://www.swdt.com/', 1, '2025-04-06 16:58:18', '2025-04-06 16:58:18');
INSERT INTO `ai_mindmap_tools` VALUES (8, 'http://localhost:9090/files/20250406/75bcb0a3a8f84c56b85745e996f16dab.jpg', 'XMind AI', '最好的AI头脑风暴和思维导图工具', 'https://xmind.ai/', 1, '2025-04-06 17:01:09', '2025-04-06 17:01:09');
INSERT INTO `ai_mindmap_tools` VALUES (9, 'http://localhost:9090/files/20250406/8a944ebffe664e5e9d0328013b4319b3.png', '妙办画板', '妙办画板，一个提升您与团队效率的在线实时协作空间，集AI创作、思维导图、分析模型、头脑风暴多种创意表达能力于一体。', 'https://imiaoban.com/', 1, '2025-04-06 17:14:51', '2025-04-06 17:14:51');
INSERT INTO `ai_mindmap_tools` VALUES (10, 'http://localhost:9090/files/20250406/54acee04394940d48803924f614b4662.jpg', 'AmyMind', 'AmyMind是一款可以通过AI生成、探索、导出思维导图的应用，支持多种格式和平台。', 'https://amymind.com/zh-cn/', 1, '2025-04-06 17:17:00', '2025-04-06 17:17:09');
INSERT INTO `ai_mindmap_tools` VALUES (11, 'http://localhost:9090/files/20250406/23fa33d9d2a144c9afa369d2e9ccf7d0.png', 'Mapify', 'Mapify是一款能够将文本、网页、视频等内容转换成思维导图的AI工具，支持多种格式导出和幻灯片演示。', 'https://mapify.so/cn/', 1, '2025-04-06 17:19:20', '2025-04-06 17:19:20');
INSERT INTO `ai_mindmap_tools` VALUES (12, 'http://localhost:9090/files/20250406/c2d0978eb23d4932b1c2f9a93fbb099b.png', 'Taskade', 'Taskade 是终极结构化任务列表和笔记应用程序，用于跟踪您的任务、记笔记和与您的团队合作。不再错过最后期限或忘记任务，因为有了 Taskade，您将拥有一切......', 'https://www.taskade.com/', 1, '2025-04-06 17:23:10', '2025-04-06 17:23:10');
INSERT INTO `ai_mindmap_tools` VALUES (13, 'http://localhost:9090/files/20250406/dad4367f62814389af06369c268cbdd9.png', 'Ayoa', 'Ayoa是一个免费在线作图平台，为用户提供强大、易用的作图工具！ 支持在线创作思维导图、速度图、自然图、径向图等。 ', 'https://www.ayoachina.com/', 1, '2025-04-06 17:25:57', '2025-04-06 17:25:57');
INSERT INTO `ai_mindmap_tools` VALUES (14, 'http://localhost:9090/files/20250406/a10225ce3c9345d69e4e61dc46ca7752.jpg', '小画桌', '小画桌是一款轻量级的在线实时协作白板，内置音视频加密传输，适用于团队远程会议、头脑风暴、在线授课、UI需求评审等场景，致力提升团队效率。', 'https://www.xiaohuazhuo.com/', 1, '2025-04-06 17:29:31', '2025-04-06 17:29:31');

-- ----------------------------
-- Table structure for ai_tools
-- ----------------------------
DROP TABLE IF EXISTS `ai_tools`;
CREATE TABLE `ai_tools`  (
  `id` int NOT NULL AUTO_INCREMENT,
  `icon` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `title` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `description` text CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL,
  `link` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `create_time` datetime NULL DEFAULT CURRENT_TIMESTAMP,
  `update_time` datetime NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 25 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of ai_tools
-- ----------------------------
INSERT INTO `ai_tools` VALUES (3, 'http://localhost:9090/files /20250328/cd343c781199438e8d6dd9d5cfe968bc.png', 'ChatGPT', 'ChatGPT是OpenAI开发的AI助手，擅长多轮对话和创意生成，支持多种语言和复杂任务处理', 'https://chat.openai.com', '2025-03-28 16:00:12', '2025-03-28 21:30:22');
INSERT INTO `ai_tools` VALUES (11, 'http://localhost:9090/files /20250328/40db166f139d4b109e986ecec585fce2.png', 'DeepSeek', 'DeepSeek是国内目前最强大的AI工具，是一个专注长文本和高效问答的中文AI助手', 'https://chat.deepseek.com/', '2025-03-28 21:23:38', '2025-03-28 21:23:38');
INSERT INTO `ai_tools` VALUES (12, 'http://localhost:9090/files /20250329/9650b42d408a42e4a91bc1d084b7a7c0.png', '腾讯元宝', '腾讯元宝是腾讯推出的多功能AI助手，擅长中文处理与创作。', 'https://yuanbao.tencent.com/', '2025-03-29 11:40:42', '2025-03-29 11:40:42');
INSERT INTO `ai_tools` VALUES (13, 'http://localhost:9090/files /20250329/0d509cf6c4904da583cf7ab125d93fee.png', 'Claude', 'Claude 是 Anthropic 的安全型 AI，专注长文本与逻辑推理。', 'https://claude.ai', '2025-03-29 11:42:41', '2025-03-29 11:42:41');
INSERT INTO `ai_tools` VALUES (14, 'http://localhost:9090/files /20250329/dfb180af7d0a4f99b13ff6cefd261959.jpg', '豆包AI', '豆包AI 是字节跳动推出的 AI 智能助手，具备多轮对话、创意写作、知识问答等能力，深度整合今日头条、抖音等生态内容', 'https://www.doubao.com', '2025-03-29 11:44:58', '2025-03-29 11:44:58');
INSERT INTO `ai_tools` VALUES (15, 'http://localhost:9090/files /20250329/bd797b74114648dcb829e0d134045511.png', 'kimi AI', 'Kimi AI 是月之暗面（Moonshot AI）推出的智能助手，专注于长文本处理与高效信息处理，支持超长上下文理解，适合阅读、写作、编程等场景。', 'https://kimi.moonshot.cn/', '2025-03-29 11:46:11', '2025-03-29 11:46:11');
INSERT INTO `ai_tools` VALUES (16, 'http://localhost:9090/files /20250329/8d795d6007bd4f2189acf9cac2c8d19e.png', '讯飞星火', '讯飞星火是科大讯飞推出的认知大模型，具备强大的多模态交互能力，支持文本生成、语言理解、逻辑推理、数学计算等', 'https://xinghuo.xfyun.cn', '2025-03-29 11:47:53', '2025-03-29 11:47:53');
INSERT INTO `ai_tools` VALUES (17, 'http://localhost:9090/files /20250329/987b71c7713649379fb9c47f7268a991.jpg', 'Meta AI', 'Meta AI 是 Meta（原 Facebook）公司开发的人工智能助手，集成于 WhatsApp、Instagram 等社交平台，支持多语言对话、图像生成与实时信息检索', 'https://ai.meta.com', '2025-03-29 11:51:21', '2025-03-29 11:51:21');
INSERT INTO `ai_tools` VALUES (18, 'http://localhost:9090/files /20250329/953329d1d05c480bb12817e406575926.png', '纳米AI搜索', '纳米AI搜索是智能问答与全网检索结合的AI工具', 'https://so.n.cn/', '2025-03-29 11:53:26', '2025-03-29 11:53:26');
INSERT INTO `ai_tools` VALUES (19, 'http://localhost:9090/files /20250329/73c4700e23df4afe875a0ec922226ebd.jpg', '华为小艺', '小艺是华为公司自主研发的AI智慧助手，基于最新的人工智能技术，提供了AI知识问答、AI写作、AI文档阅读、文档助手、编码助手、鸿蒙代码生成、鸿蒙代码问答、AI识图等多种AI功能', 'https://xiaoyi.huawei.com/chat/', '2025-03-29 11:57:13', '2025-03-29 11:57:13');
INSERT INTO `ai_tools` VALUES (20, 'http://localhost:9090/files /20250329/cc4e92b033704a729d824b148f158808.jpg', '通义千问', '通义千问是阿里多模态AI助手，支持文本、语音、图像交互。', 'https://tongyi.aliyun.com/', '2025-03-29 11:59:15', '2025-03-29 11:59:15');
INSERT INTO `ai_tools` VALUES (21, 'http://localhost:9090/files /20250329/b99914c40dc84a6da620f2c01199d881.jpg', '智谱清言', '智谱清言 是智谱AI（Zhipu AI）推出的智能助手，基于 ChatGLM 和 GLM-4 大模型开发，支持中英双语对话、多轮交互及多场景应用，涵盖写作、编程、学习、职场、生活等领域，致力于打造“中文版ChatGPT”', 'https://chatglm.cn', '2025-03-29 12:01:14', '2025-03-29 12:01:14');
INSERT INTO `ai_tools` VALUES (22, 'http://localhost:9090/files/20250411/7ac0760570c548f98d93e3f6e79d36cd.jpg', 'Microsoft Copilot ', 'Microsoft Copilot 是微软推出的多功能AI助手，深度集成于Windows、Office、Xbox等生态，提供智能办公、编程辅助、游戏指导等全方位AI服务', 'https://copilot.microsoft.com', '2025-03-29 12:13:10', '2025-04-11 17:05:36');
INSERT INTO `ai_tools` VALUES (23, 'http://localhost:9090/files /20250329/5108ab9b9add4c76ad7cf257e8c35d77.png', 'Gemini AI', 'Google Gemini 是谷歌推出的多模态AI大模型家族，由DeepMind开发，涵盖文本、图像、音频、视频及代码处理能力', 'https://gemini.google.com', '2025-03-29 12:14:47', '2025-03-29 12:14:47');
INSERT INTO `ai_tools` VALUES (24, 'http://localhost:9090/files /20250329/b5d340efa45749cebbb10c684e0ff0ac.png', '问小白', '问小白是元石科技推出的AI智能助手，基于自研的元石大模型，并结合DeepSeek V3等先进技术，提供高效精准的AI搜索、内容生成、多模态交互等功能', 'https://wenxiaobai.com', '2025-03-29 12:23:22', '2025-03-29 12:23:22');

-- ----------------------------
-- Table structure for audio_tool
-- ----------------------------
DROP TABLE IF EXISTS `audio_tool`;
CREATE TABLE `audio_tool`  (
  `id` int NOT NULL AUTO_INCREMENT,
  `icon` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '图标URL',
  `name` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '网站名称',
  `description` text CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL COMMENT '网站描述',
  `url` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '网站链接',
  `is_free` tinyint(1) NULL DEFAULT 1 COMMENT '是否免费:0-付费,1-免费',
  `create_time` datetime NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `update_time` datetime NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 21 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci COMMENT = 'AI音频工具表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of audio_tool
-- ----------------------------
INSERT INTO `audio_tool` VALUES (1, '/files/20250401/9b2d036b090746d993e90bf2a9a9d21d.png', '魔音工坊', '媲美真人的AI配音软件，广泛应用于短视频配音、有声书、有声电台、外语出海等多种配音场景. 简单易用、轻松上手。魔音工坊，一家专注于品质配音的软件！', 'https://www.moyin.com/', 1, '2025-04-01 10:24:56', '2025-04-01 10:24:56');
INSERT INTO `audio_tool` VALUES (2, '/files/20250403/842c6c19986a452984a36a0f8fad9721.png', '海螺AI音频', '海螺AI音频模块支持声音克隆、文本转语音、多语言、多情绪等功能，可用少量音频样本复刻任何人的声音。', 'https://hailuoai.com/audio', 1, '2025-04-03 21:21:37', '2025-04-03 21:21:37');
INSERT INTO `audio_tool` VALUES (3, '/files/20250403/0b1009a452954182b74cd0792afa349a.png', 'MiniMax Audio', '轻松创建有声读物或播客，无需截断;在单个输入中支持多达 200000 个字符的异步语音合成。查看、删除或整理您的语音...', 'https://www.minimax.io/audio', 1, '2025-04-03 21:24:31', '2025-04-03 21:24:31');
INSERT INTO `audio_tool` VALUES (4, '/files/20250403/ef22af96c045457e882bfcb05e92e28f.png', 'AiMakeSong', '使用 AI 驱动的工具从文本或歌词中创建独特的音乐。从 70+ 风格、流派和声音中进行选择，并免费下载您的免版税歌曲。', 'https://www.aimakesong.com/zh-CN', 1, '2025-04-03 21:29:48', '2025-04-03 21:29:48');
INSERT INTO `audio_tool` VALUES (5, '/files/20250403/ebcebb8c573a418fb0687201f1c63949.png', 'AI 歌词生成器', '我们的 AI 歌词生成器界面简洁直观，几秒内即可创作量身定制的歌词。 无论是流行、说唱、摇滚还是乡村音乐，都能轻松驾驭！ 免费试用，人人可上手！', 'https://musichero.ai/zh-CN/ai-lyrics-generator', 1, '2025-04-03 21:32:24', '2025-04-03 21:32:24');
INSERT INTO `audio_tool` VALUES (6, '/files/20250403/b9d13db9fdfb470ab28d7c19a0e8d147.png', 'Suno AI V3', 'SunoAI发布音乐生成模型V3，可创作长达2分钟的完整歌曲，支持多种风格，且已免费开放。 用户可输入简短词汇创作歌曲，V3提高了结尾质量和提示词连贯性，并引入AI音乐水印系统保护创作。', 'https://suno.com/home', 1, '2025-04-03 21:34:45', '2025-04-03 21:34:45');
INSERT INTO `audio_tool` VALUES (7, '/files/20250403/8bfc5a3207dc4d67a91549f9ac7d5233.jpg', 'Voice.ai ', '借助 voice.ai 您可以使用尖端的文本转语音模型将文本转换为逼真的语音，从而提供高质量、自然的画外音。', 'https://voice.ai/', 1, '2025-04-03 21:37:18', '2025-04-03 21:37:18');
INSERT INTO `audio_tool` VALUES (8, '/files/20250403/1a0cd5f57cc94b4eb2ae8448e1d9b5fc.jpg', 'Adobe Podcast ', 'Adobe Podcast 是一种基于 Web 的工具，可让您使用 AI 创建高质量的播客和画外音。您可以增强语音、修复麦克风问题、像文档一样编辑音频。', 'https://podcast.adobe.com/', 1, '2025-04-03 21:40:29', '2025-04-03 21:40:29');
INSERT INTO `audio_tool` VALUES (9, '/files/20250403/2d4c63a3c32a427894f161e8a99c78c6.png', '即梦AI', '即梦AI是一个AI创作平台，可激发艺术创意、提升绘画和视频创作体验。 您可以利用AI智能，将想象变为现实。 即梦AI支持文字绘图、文字生成视频和图片生成视频，并提供创作灵感。', 'https://jimeng.jianying.com/', 1, '2025-04-03 21:42:42', '2025-04-03 21:42:42');
INSERT INTO `audio_tool` VALUES (10, '/files/20250404/50f10a5ad2ef421d980f2c6a6b85d861.jpg', '白日梦AI', '白日梦AI是一款领先的文生视频类AIGC创作平台，专注于AI视频内容生成，提供AI生成视频教程、AI文生视频、AI动态画面。', 'https://aibrm.com/', 1, '2025-04-04 10:49:22', '2025-04-04 10:49:22');
INSERT INTO `audio_tool` VALUES (11, '/files/20250404/d4429409e0714af890acf9ecb0a92fb1.png', '讯飞绘镜', '讯飞绘镜是一款AI视频创作平台。 输入创意，即可生成脚本和分镜图片，并将静态分镜化为动态视频。', 'https://typemovie.art/home/index.html', 1, '2025-04-04 10:52:12', '2025-04-04 10:52:12');
INSERT INTO `audio_tool` VALUES (12, '/files/20250404/e37b8a2f829b4a6d8c7a27ade8311aab.jpg', 'KreadoAI', 'KreadoAI是一款在线视频制作工具，可以将文字、图片、音频等内容转换为专业级的AI视频，支持700多种AI虚拟形象和1600多种声音，覆盖140多种语言。', 'https://www.kreadoai.com/zh', 1, '2025-04-04 10:57:47', '2025-04-04 10:57:47');
INSERT INTO `audio_tool` VALUES (13, '/files/20250404/7b659bb487e64b47a1d28dc80fdca51f.jpg', '声动视界(SoundView AI)', '声动视界是一个提供多种视频创作和本地化服务的平台，可以帮助用户将视频批量翻译成多种语言，修改文稿，合成音频，添加字幕，模仿音色，生成短视频脚本等。', 'https://soundviewai.com/video-workbench', 1, '2025-04-04 11:03:41', '2025-04-04 11:03:41');
INSERT INTO `audio_tool` VALUES (14, '/files/20250404/e74d406a885a4729b269ef9fa3126d71.png', 'Lovo AI', 'lovo ai,为你带来非常接近真人的发音,支持语音学习,在线克隆真人情感语音发声.智能文本识别,停顿/情感/语调,通过文本转换语音还原最真实的配音内容.', 'https://lovo.ai/zh', 1, '2025-04-04 11:08:11', '2025-04-04 11:08:11');
INSERT INTO `audio_tool` VALUES (15, '/files/20250404/a95c02db169340e694d8964892e59322.jpg', '腾讯TME Studio', '腾讯TME Studio，音乐创作助手，集音乐分离、MIR计算、辅助写词等智能功能，助力音乐爱好者及创作者轻松创作。', 'https://aishenqi.net/tool/tengxuntme-studio', 1, '2025-04-04 11:11:19', '2025-04-04 11:11:19');
INSERT INTO `audio_tool` VALUES (16, '/files/20250404/4dc256ef69de43f4a9a661cbe878790f.jpg', 'Udio', '免费的Al音乐创作工具，每月可生成1200首歌曲。', 'https://www.udio.com/', 1, '2025-04-04 11:17:07', '2025-04-04 11:17:07');
INSERT INTO `audio_tool` VALUES (17, '/files/20250404/55044d58e662452ea8e037891019cece.png', 'Uberduck', 'Uberduck是一个开源的AI语音生成和合成的社区，该平台提供了超过5000多种声音帮助用户制作AI配音和语音，用户可以从文本生成逼真的语音、歌唱和说唱，创建自定义语音克隆。 ', 'https://www.uberduck.ai/', 1, '2025-04-04 11:20:50', '2025-04-04 11:20:50');
INSERT INTO `audio_tool` VALUES (18, '/files/20250404/61309abcd8df4b02994d7d09164c0430.png', 'ACE Studio ', '使用 ACE Studio 的专业 AI 歌声生成器，从 MIDI 和歌词创建录音室品质的 AI 人声。了解专家如何使用我们的 AI 歌声生成器来创建......', 'https://acestudio.cn/', 1, '2025-04-04 11:27:06', '2025-04-04 11:27:06');
INSERT INTO `audio_tool` VALUES (19, '/files/20250404/945fa69a536349bb83c38496f38e4876.png', 'Sonauto', 'Sonauto 是一款基于人工智能技术的在线音乐创作工具，允许用户快速生成具有多种风格的完整歌曲。', 'https://sonauto.ai/', 1, '2025-04-04 11:43:01', '2025-04-04 11:43:01');
INSERT INTO `audio_tool` VALUES (20, '/files/20250404/969a23e22f3b469e98a21cb1e30f73af.png', 'Riffusion', 'Riffusion 是一个免费开源的具有稳定扩散的实时音乐和音频生成库，用户只需输入音乐描述，AI便可以生成对应风格的音乐。', 'https://www.riffusion.com/', 1, '2025-04-04 11:49:36', '2025-04-04 11:49:36');

-- ----------------------------
-- Table structure for chart_tool
-- ----------------------------
DROP TABLE IF EXISTS `chart_tool`;
CREATE TABLE `chart_tool`  (
  `id` int NOT NULL AUTO_INCREMENT,
  `icon` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '图标URL',
  `name` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '网站名称',
  `description` text CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL COMMENT '网站描述',
  `url` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '网站链接',
  `is_free` tinyint(1) NULL DEFAULT 1 COMMENT '是否免费:0-付费,1-免费',
  `create_time` datetime NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `update_time` datetime NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 10 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci COMMENT = '图表工具表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of chart_tool
-- ----------------------------
INSERT INTO `chart_tool` VALUES (1, '/files/20250401/a7bccaa4fd4d4acdafc5fd2458c5a27d.png', 'draw.io', 'draw.io 是免费的在线图表软件。您可以将其用作流程图制作器、网络图软件、在线创建 UML、作为 ER 图工具、设计数据库架构、构建......', 'https://www.drawio.com/', 1, '2025-04-01 09:53:57', '2025-04-01 09:53:57');
INSERT INTO `chart_tool` VALUES (2, '/files/20250401/470f857eff1f4e5ca5044c710668166c.png', 'PixPin', 'PixPin是一款功能强大的免费截图工具，支持截图、录屏、长截图、OCR文字识别、屏幕贴图等功能。 为设计师、开发者、办公人员提供高效的屏幕操作体验。', 'https://pixpin.cn/', 1, '2025-04-01 21:37:13', '2025-04-01 21:37:13');
INSERT INTO `chart_tool` VALUES (3, '/files/20250407/2f529148ba244a08abca907dc3b2dcf4.png', 'ChartCool', 'ChartCool是一款功能强大的免费在线数据可视化工具，输入数据即可生成图表、网页交互图表制作，数据动图、矢量图表、信息图表；支持曲线图，折线图等。', 'https://www.ichartcool.com/zh/index.html', 1, '2025-04-07 21:42:56', '2025-04-07 21:42:56');
INSERT INTO `chart_tool` VALUES (4, '/files/20250408/a932ff408eac40beba24dc8ebad18192.png', 'Hiplot', 'Hiplot是一个全面、开放的一站式生物医学可视化分析平台，提供云工具、云流程、云课堂、云市场等功能，支持自主定制组学数据全流程自动分析。', 'https://hiplot.com.cn/', 1, '2025-04-08 10:20:06', '2025-04-08 10:20:06');
INSERT INTO `chart_tool` VALUES (5, '/files/20250408/3fedc3ffec4a476fa6035800a95c04b6.jpg', '镝数图表', '镝数图表拥有上百种图表模板，涵盖了饼图、折线图、柱状图、散点图、桑基图、玫瑰图、词云图等图表类型，输入数据即可一键生成可视化图表。', 'https://dycharts.com/', 1, '2025-04-08 10:28:05', '2025-04-08 10:28:05');
INSERT INTO `chart_tool` VALUES (6, '/files/20250408/e5444f801c2747f7b0626c218631c369.png', '图表秀', '图表秀是一个免费在线图表制作工具，只需简单3步，就能帮你轻松搞定可视化图表。', 'https://www.tubiaoxiu.com/', 1, '2025-04-08 10:33:50', '2025-04-08 10:33:50');
INSERT INTO `chart_tool` VALUES (7, '/files/20250408/773d848e75a2434fbada2f5a730fd58b.jpg', '凡科快图', '凡科快图是一个在线图片编辑工具，包括制作关键词云图、自动AI抠图、图片压缩、转换格式、图片修复、ico生成等，功能多，且非常实用。', 'https://kt.fkw.com/', 1, '2025-04-08 10:37:25', '2025-04-08 10:37:25');
INSERT INTO `chart_tool` VALUES (8, '/files/20250408/5e65ba8f27d54f7da2cec6ac5d842dff.png', 'GitMind', 'GitMind是国内一款可免费下载的在线制作流程图软件，模板类型全，且操作简单，能满足毕业论文图表需求。', 'https://gitmind.cn/?apptype=chn-testcpa', 1, '2025-04-08 10:41:15', '2025-04-08 10:41:15');
INSERT INTO `chart_tool` VALUES (9, '/files/20250408/26b17134c1104bc7ab29fa1c6022415b.png', 'Snipaste', 'Snipaste，堪称截图与贴图工具中的佼佼者。 它提供矩形、椭圆等多样化截图模式，截图过程可精准微调并随心标注。 其独特的贴图功能，能将截图贴于屏幕且支持多层管理。', 'https://zh.snipaste.com/', 1, '2025-04-08 10:45:40', '2025-04-08 10:45:40');

-- ----------------------------
-- Table structure for code_hosting_tool
-- ----------------------------
DROP TABLE IF EXISTS `code_hosting_tool`;
CREATE TABLE `code_hosting_tool`  (
  `id` int NOT NULL AUTO_INCREMENT,
  `icon` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '图标URL',
  `name` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '工具名称',
  `description` text CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL COMMENT '工具描述',
  `url` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '官网链接',
  `create_time` datetime NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `update_time` datetime NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 6 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci COMMENT = '代码托管工具表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of code_hosting_tool
-- ----------------------------
INSERT INTO `code_hosting_tool` VALUES (1, 'http://localhost:9090/files/20250331/0832749f97034d4383d8fc2269c25605.png', 'Github', '全球最大的开源社区平台，拥有1.2亿+开发者。提供强大的协作工具如Pull Request和GitHub Actions，适合开源项目和国际团队。2025年新增AI代码审查功能，但国内访问仍需加速器', 'https://github.com/', '2025-03-31 20:10:21', '2025-03-31 20:21:37');
INSERT INTO `code_hosting_tool` VALUES (2, 'http://localhost:9090/files/20250331/5ba07fe644e94a49ad12c5538741c761.jpg', 'Gitee(码云)', '国内领先的代码托管平台，支持Git和SVN，访问速度快且符合本地数据合规要求。提供项目管理、CI/CD和开源社区资源，适合国内开发者', 'https://gitee.com', '2025-03-31 20:29:52', '2025-03-31 20:29:52');
INSERT INTO `code_hosting_tool` VALUES (3, 'http://localhost:9090/files/20250331/b4efdbe0f6774f7b9d3c6bfcf2cd5769.jpg', 'GitLab', '提供完整的 DevOps 生命周期管理，集成 CI/CD、安全扫描等功能。支持自托管，适合企业级开发，免费版功能丰富，高级版$29/用户/月。', 'https://gitlab.com', '2025-03-31 20:30:41', '2025-03-31 20:30:41');
INSERT INTO `code_hosting_tool` VALUES (4, 'http://localhost:9090/files/20250331/487bada5d2d94aef91bb71b9cc449ac8.png', 'Coding', '腾讯旗下的代码托管与 DevOps 平台，支持 Git 仓库、持续集成等，国内访问稳定，适合中小企业和个人开发者。', 'https://coding.net', '2025-03-31 20:31:29', '2025-03-31 20:31:29');
INSERT INTO `code_hosting_tool` VALUES (5, 'http://localhost:9090/files/20250331/f67011c885804ab081106c497bebb04a.jpg', 'Bitbucket', 'Atlassian 旗下的 Git 代码托管平台，与 Jira、Trello 深度集成。免费支持最多 5 人协作，适合敏捷开发团队。', 'https://bitbucket.org', '2025-03-31 20:32:12', '2025-03-31 20:32:12');

-- ----------------------------
-- Table structure for coding_practice
-- ----------------------------
DROP TABLE IF EXISTS `coding_practice`;
CREATE TABLE `coding_practice`  (
  `id` int NOT NULL AUTO_INCREMENT,
  `icon` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '图标URL',
  `name` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '网站名称',
  `description` text CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL COMMENT '网站描述',
  `url` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '网站链接',
  `is_free` tinyint(1) NULL DEFAULT 1 COMMENT '是否免费:0-付费,1-免费',
  `create_time` datetime NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `update_time` datetime NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 11 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci COMMENT = '编程刷题网站表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of coding_practice
-- ----------------------------
INSERT INTO `coding_practice` VALUES (1, '/files/20250401/b7b47a1b65a444aa9809af70d5f9d01a.png', '力扣（LeetCode）', 'LeetCode是一个用于编码面试准备的在线平台。该服务提供旨在供用户练习编码的编码和算法问题。LeetCode作为技术面试和编程竞赛的资源，在求职者和编程爱好者中广受欢迎。', 'https://leetcode.cn/', 1, '2025-04-01 10:32:43', '2025-04-01 10:32:43');
INSERT INTO `coding_practice` VALUES (2, '/files/20250401/e0ceba8dc2574e1cad532de307fb3f5c.png', 'PTA | 程序设计类实验辅助教学平台', '支持判断、选择（单选、多选）、填空（包括程序填空、函数填空）、编程（包括常规编程、多文件编程、数据库编程）、主观、完形等题目类型，并为使用者提供智能推荐。', 'https://pintia.cn/', 1, '2025-04-01 20:27:47', '2025-04-01 20:27:47');
INSERT INTO `coding_practice` VALUES (3, '/files/20250401/1bbdec0a34984c54bdc6d4661af45fab.png', '洛谷', '洛谷创办于2013年，致力于为参加noip、noi、acm的选手提供清爽、快捷的编程体验。 它拥有在线测题系统、强大的社区、在线学习功能。 很多教程内容由各位oiers提供的，内容广泛。', 'https://www.luogu.com.cn/', 1, '2025-04-01 20:28:39', '2025-04-01 20:28:39');
INSERT INTO `coding_practice` VALUES (4, '/files/20250401/89fa429b87ed493092939fdd1cd33755.png', '牛客网', '求职之前，先上牛客，就业找工作一站解决。 互联网IT技术/产品/运营/硬件/汽车机械制造/金融/财务管理/审计/银行/市场营销/地产/快消/管培生等等专业技能学习/备考/求职神器。', 'https://www.nowcoder.com/ta/classic-code', 1, '2025-04-01 20:31:02', '2025-04-01 20:31:02');
INSERT INTO `coding_practice` VALUES (5, '/files/20250401/e5964d9051524e3dacc899185d23a0c0.png', '超级码客', '程序员刷题超级码客#精编100%IT技术岗位Java,PHP,Python,Go,C#,C++,前端,数据库,运维4万道重点岗位海量面试题&答案解析', 'https://www.chaojimake.cn/', 1, '2025-04-01 20:33:02', '2025-04-01 20:33:02');
INSERT INTO `coding_practice` VALUES (6, '/files/20250401/215de944d85d4ecda81f88872f58665c.png', '面试鸭', '程序员面试刷题，就来面试鸭，程序员免费求职面试刷题网站。海量高频Java,前端,后端,C++,Go,Python,软件测试,IT运维,数据库,SQL,数据结构,算法面试题和优质题解。', 'https://www.mianshiya.com/', 1, '2025-04-01 20:34:33', '2025-04-01 20:34:33');
INSERT INTO `coding_practice` VALUES (7, '/files/20250401/35c8fd4d0ec045499c4cbcaf768858c6.png', 'LintCode', '强大的编码训练系统。LintCode 的面试题目最多，涵盖 Google、Facebook、LinkedIn、Amazon、Microsoft 等。', 'https://www.lintcode.com/', 1, '2025-04-01 20:36:48', '2025-04-01 20:36:48');
INSERT INTO `coding_practice` VALUES (8, '/files/20250401/02202a8a1d3d40a0894f8b535386e737.png', 'C语言网', 'C语言网（Dotcpp编程），老牌的编程入门学习平台，不仅仅提供C语言、C++、Java、Python、编译器（编程软件）等技术的教程资源和工具，还提供包括计算机二级、蓝桥杯真题在内的编程题库，让初学者学练同步，真正学会编程！', 'https://www.dotcpp.com/oj/problemset.html', 1, '2025-04-01 20:40:13', '2025-04-01 20:40:13');
INSERT INTO `coding_practice` VALUES (9, '/files/20250401/8316669a9cd641afafb8252f27db6b5f.png', 'hihoCoder', 'hihoCoder成立于2012年，我们致力于成为编程者与企业之间交流沟通的桥梁，同时也努力为编程爱好者提供提高自身编程水平的场所。', 'https://www.hihocoder.com/', 1, '2025-04-01 20:44:58', '2025-04-01 20:44:58');
INSERT INTO `coding_practice` VALUES (10, '/files/20250401/3edf4984d5a14e829fa2ebc62c97885c.png', '蓝桥云课', '蓝桥云课是国内领先的T在线编程及在线实训学习平台，专业导师提供精选的实践项目，创新的技术使得学习者无需配置繁琐的本地环境，随时在线流畅使用。', 'https://www.lanqiao.cn/', 1, '2025-04-01 20:47:41', '2025-04-01 20:47:41');

-- ----------------------------
-- Table structure for common_tools
-- ----------------------------
DROP TABLE IF EXISTS `common_tools`;
CREATE TABLE `common_tools`  (
  `id` int NOT NULL AUTO_INCREMENT,
  `icon` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '工具图标',
  `name` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '工具名称',
  `description` text CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL COMMENT '工具描述',
  `url` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '工具链接',
  `category` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '工具分类',
  `create_time` datetime NULL DEFAULT NULL COMMENT '创建时间',
  `update_time` datetime NULL DEFAULT NULL COMMENT '更新时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 30 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci COMMENT = '常用工具' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of common_tools
-- ----------------------------
INSERT INTO `common_tools` VALUES (1, 'http://localhost:9090/files/20250330/ef593dceb31542acb0bc3b2745e67140.png', '软件管家', '一站式解决软件下载与管理难题——提供安全、高效、便捷的软件服务，告别繁琐安装与病毒困扰。可以下载并破解许多软件或者集成工具（如Ps、IDEA、Pr、office等）', 'https://softgj.com/', '综合类', '2025-03-30 16:33:48', '2025-03-30 16:33:48');
INSERT INTO `common_tools` VALUES (2, 'http://localhost:9090/files/20250330/18877d1bdd334f1fb95fe6ab852dc800.jpg', 'CSDN', 'CSDN（中国开发者网络） 是中国领先的IT技术社区和开发者服务平台，为程序员提供技术问答、学习资源、博客分享、在线工具及职业发展服务。', 'https://www.csdn.net/', '工科学习论坛', '2025-03-30 16:38:14', '2025-03-30 16:38:14');
INSERT INTO `common_tools` VALUES (3, 'http://localhost:9090/files/20250330/9fb33923c8a34df98807dd59454fba6c.png', 'DeepSeek', 'DeepSeek 是 深度求索（DeepSeek） 推出的 AI 大模型助手，具备强大的 自然语言处理 和 代码生成 能力，支持 128K 超长上下文，擅长 中文理解、逻辑推理、编程辅助 等任务。', 'https://chat.deepseek.com/', '人工智能', '2025-03-30 16:40:04', '2025-03-30 16:40:04');
INSERT INTO `common_tools` VALUES (4, 'http://localhost:9090/files/20250330/dbb1928819ec4bb0b2db49b66c34c05c.png', 'Kimi智能助手', 'Kimi智能助手 是 月之暗面（Moonshot AI） 推出的 AI 对话助手，专注于 长文本处理 和 高效信息整合，支持 20 万汉字超长上下文，擅长 阅读解析、写作辅助、编程问答 等任务。', 'https://kimi.moonshot.cn', 'AI工具', '2025-03-30 16:41:43', '2025-03-30 16:41:43');
INSERT INTO `common_tools` VALUES (5, 'http://localhost:9090/files/20250330/10bd674ce1834d3ab24acb430f062648.png', 'w3school在线教程', 'W3School 是全球知名的 Web 技术学习平台，提供 免费、全面 的编程教程和在线实践工具，涵盖 HTML、CSS、JavaScript、Python、SQL 等主流技术，适合 初学者和开发者 快速掌握 Web 开发技能。', 'https://www.w3school.com.cn/', '技术学习平台', '2025-03-30 16:48:17', '2025-03-30 16:48:17');
INSERT INTO `common_tools` VALUES (6, 'http://localhost:9090/files/20250330/4c97df0e43bb4736afde1a39258aa3ca.png', 'ChatGPT', 'ChatGPT 是 OpenAI 开发的 AI 对话助手，基于 GPT 大模型，支持 自然语言交互、文本创作、代码生成 等功能，广泛应用于 学习、办公、编程 等场景。', 'https://chat.openai.com', 'AI对话', '2025-03-30 16:49:50', '2025-03-30 16:49:50');
INSERT INTO `common_tools` VALUES (7, 'http://localhost:9090/files/20250330/a931328756ec45dc93409cbf8b0f0fab.png', 'ChatExcel', 'ChatExcel 是由 北京大学深圳研究生院/信息工程学院 团队开发的 AI 表格处理工具，通过 自然语言交互 实现 Excel 的自动化操作，无需记忆复杂函数或手动编写公式，大幅降低数据处理门槛。', 'https://chatexcel.com', 'AI表格处理', '2025-03-30 16:51:34', '2025-03-30 16:51:34');
INSERT INTO `common_tools` VALUES (8, 'http://localhost:9090/files/20250330/35c2de85210e4d138922c0f194cf2308.png', 'ChatLaw', 'ChatLaw 是中国首个 法律垂直领域大模型，由 北京大学法律人工智能实验室 联合 幂律智能 研发，专注于为法律从业者及普通用户提供 精准、可靠的法律AI服务。', 'https://www.chatlaw.cn/', 'AI法律工具', '2025-03-30 16:53:35', '2025-03-30 16:53:35');
INSERT INTO `common_tools` VALUES (9, 'http://localhost:9090/files/20250330/a7ca81a6a8724618bc6056ca663c0523.png', '思谋学术', '思谋学术 是一个专注于 科研学术资源导航 的网站，主要提供 Google 学术搜索入口 和 免费论文下载通道，帮助科研工作者高效获取学术文献。', 'https://ac.scmor.com/', '学术资源导航', '2025-03-30 16:56:11', '2025-03-30 16:56:11');
INSERT INTO `common_tools` VALUES (10, 'http://localhost:9090/files/20250330/0c2f56db262144b69265bc133796f48a.jpg', 'DeepL', 'DeepL 是一款由德国公司 DeepL GmbH 开发的 AI 翻译工具，以其 高精度自然语言处理 和 流畅的翻译质量 闻名，支持 31 种语言互译，尤其擅长 学术论文、商务文件、技术文档 等专业内容的翻译。', 'https://www.deepl.com', 'AI翻译工具', '2025-03-30 16:59:54', '2025-03-30 16:59:54');
INSERT INTO `common_tools` VALUES (11, 'http://localhost:9090/files/20250330/519f531f1dcd464f83c65025014b51ad.jpg', 'Garmmarly', 'Grammarly 是一款由 Grammarly Inc. 开发的 AI 英语语法校对与写作辅助工具，广泛应用于 学术写作、商务邮件、内容创作 等领域，支持 多平台实时纠错 并提供 风格优化建议，被誉为“英语写作神器”', 'https://www.grammarly.com', 'AI英语辅助工具', '2025-03-30 17:01:28', '2025-03-30 17:01:28');
INSERT INTO `common_tools` VALUES (12, 'http://localhost:9090/files/20250330/c440e8cc97ef4a248b95fe2f80f44bd6.png', 'Github', 'GitHub 是全球领先的 代码托管与协作平台，由 微软 旗下运营，为开发者提供 Git 版本控制、项目管理、CI/CD 等全生命周期开发支持，拥有 1 亿+开发者用户 和 4.3 亿+开源仓库。', 'https://github.com', '代码托管平台', '2025-03-30 17:11:22', '2025-03-30 17:11:22');
INSERT INTO `common_tools` VALUES (13, 'http://localhost:9090/files/20250330/9040c8d9f9b544658ed1d171b31df1ca.jpg', '知网', '知网（中国知网，CNKI） 是中国最大的 学术资源数据库 和 知识服务平台，由 清华大学、清华同方 于 1999年6月 发起建设，是国家重点支持的 知识基础设施工程（NKI），旨在促进学术资源的共享与利用。', 'https://www.cnki.net', '学术资源导航', '2025-03-30 17:12:45', '2025-03-30 17:12:45');
INSERT INTO `common_tools` VALUES (14, 'http://localhost:9090/files/20250330/796cc41a27a24f2ca5f718a8d5feba6b.jpg', '知乎', '知乎 是中国领先的 网络问答社区 和 原创内容平台，由 北京智者天下科技有限公司 于 2011年1月26日 正式上线，创始人为 周源2。知乎以 “让人们更好地分享知识、经验和见解，找到自己的解答” 为使命，聚集了中文互联网科技、商业、影视、文化等领域的专业人士，形成了高质量的讨论氛围。', 'https://www.zhihu.com', '网络问答社区', '2025-03-30 17:14:12', '2025-03-30 17:14:12');
INSERT INTO `common_tools` VALUES (15, 'http://localhost:9090/files/20250330/23468138654b484e90b6b6fd0e7e08ca.png', 'SpecialSci', 'SpecialSci 是由 国道数据（GuoDao Data） 推出的 外文专题数据库，自 2000年 起为国内科研、教学及情报机构提供 高质量学术资源服务，专注于 科技领域全学科文献检索，以 非刊资源（如技术报告、会议论文）为特色，涵盖 自然科学、工程技术、人文社科 等广泛领域。', 'https://specialsci.cn', '学术资源检索', '2025-03-30 17:16:01', '2025-03-30 17:16:01');
INSERT INTO `common_tools` VALUES (16, 'http://localhost:9090/files/20250330/b9370b89b70043c49fcf324c6639d479.png', 'AutoDL算力云', 'AutoDL算力云 是由 视拓云（南京）科技有限公司 开发的 深度学习算力租赁平台，专注于为AI开发者提供 高性能GPU资源 和 便捷的深度学习环境，支持 按需付费、弹性计费，适合个人研究者、企业团队及教育机构使用。', 'https://www.autodl.com', '算力租赁平台', '2025-03-30 17:19:50', '2025-03-30 17:19:50');
INSERT INTO `common_tools` VALUES (17, 'http://localhost:9090/files/20250330/796b4e40d0ea4c72ab2a217a83fe377c.jpg', 'IEEE', 'IEEE（电气与电子工程师学会） 是全球最大的 非营利性专业技术组织，致力于 电气、电子、计算机工程及相关科学领域 的研究与发展，在 学术出版、标准制定、技术会议 等方面具有全球影响力。', 'https://ieeexplore.ieee.org/', '学术资源检索', '2025-03-30 17:21:40', '2025-03-30 17:21:40');
INSERT INTO `common_tools` VALUES (18, 'http://localhost:9090/files/20250330/99c39b0a477a4f1488c7637dd2e289ab.png', 'PDF在线编辑器', '提供PDF文件的拆分、合并、转换、压缩等功能', 'https://www.ilovepdf.com/', 'PDF编辑', '2025-03-30 17:24:49', '2025-03-30 17:24:49');
INSERT INTO `common_tools` VALUES (19, 'http://localhost:9090/files/20250330/f049363e647f4732b88f7a4a3f3fb1de.png', 'Apache ECharts', 'Apache ECharts 是一款由 百度 开源并捐赠给 Apache 基金会的 JavaScript 数据可视化库，专注于提供 直观、交互式、高度可定制 的图表解决方案，广泛应用于 Web 开发、数据分析、商业智能（BI） 等领域。', 'https://echarts.apache.org/', ' 数据可视化工具', '2025-03-30 17:33:52', '2025-03-30 17:33:52');
INSERT INTO `common_tools` VALUES (20, 'http://localhost:9090/files/20250330/c8d4002eed5849aaa28569938c320fff.png', 'Element', 'Element，一套为开发者、设计师和产品经理准备的基于 Vue 2.0 的桌面端组件库', 'https://element.eleme.cn/', '前端组件库', '2025-03-30 17:39:25', '2025-03-30 17:39:25');
INSERT INTO `common_tools` VALUES (21, 'http://localhost:9090/files/20250330/27b9661503074c1bbbb14aaef85d8a0c.png', 'Processon', 'ProcessOn 是一款 在线流程图与思维导图工具，支持 多人实时协作，广泛应用于 产品设计、项目管理、教育学习 等场景。', 'https://www.processon.com', '画图工具', '2025-03-30 17:40:39', '2025-03-30 17:40:39');
INSERT INTO `common_tools` VALUES (22, 'http://localhost:9090/files/20250330/5fe01efd60ca40da84e10f5d7a697d8a.png', 'Element Plus', 'Element Plus 是 Element UI 的 Vue 3 升级版本，由 饿了么前端团队 和 社区开发者 共同维护，是一款现代化的 企业级 UI 组件库，专为 高效开发 Web 应用 设计。', 'https://element-plus.org/', '前端组件库', '2025-03-30 17:43:09', '2025-03-30 17:43:09');
INSERT INTO `common_tools` VALUES (23, 'http://localhost:9090/files/20250330/ff33ecd567c8454d9a643148c15719d5.png', '后台管理系统模板', '提供诸多免费的vue组件的后台管理系统模板，便于前端设计人员使用。', 'http://vue.easydo.work/', '前端开发模板', '2025-03-30 17:46:24', '2025-03-30 17:46:24');
INSERT INTO `common_tools` VALUES (24, 'http://localhost:9090/files/20250330/1e3aaa152be045b6af0f07c4ac928256.png', '中国大学Mooc(慕课)', '中国大学MOOC（慕课） 是由 网易与高等教育出版社 联合推出的 大规模在线开放课程（MOOC）平台，于 2014年 正式上线，旨在为全球学习者提供 中国顶尖高校的优质课程资源，推动教育公平与终身学习。', 'https://www.icourse163.org/', '课程学习平台', '2025-03-30 17:50:20', '2025-03-30 17:50:20');
INSERT INTO `common_tools` VALUES (25, 'http://localhost:9090/files/20250330/faafe6bdb6244454a90bf78df4395cc8.png', ' Compress2Go', '免费的在线文件压缩器', 'https://www.compress2go.com/zh', '文件压缩', '2025-03-30 17:54:37', '2025-03-30 20:59:12');
INSERT INTO `common_tools` VALUES (26, 'http://localhost:9090/files/20250330/ab70a38eb4304d24871e61acdaadb215.png', '智能图片背景移除', '专业的在线抠图工具，一键去除图片背景，支持人像、商品、证件照等多种场景，完全免费，无需登录，无水印，快速导出高清透明背景图片。', 'https://removebg.imagesplitter.vip/', '图片处理', '2025-03-30 21:13:34', '2025-03-30 21:13:34');
INSERT INTO `common_tools` VALUES (27, 'http://localhost:9090/files/20250330/188f0bbc4f674f2d8b80f19c9033e4cb.png', 'ApeakSoft', '免费水印去除剂是一款在线工具，可以快速去除照片中的水印和不必要的物体，支持多种格式，无需注册，100% 免费。它使用人工智能算法和其他算法，可以纠正水印去除引起的错误。', 'https://www.apeaksoft.com/zh-CN/watermark-remover/', '图片水印去除', '2025-03-30 21:17:27', '2025-03-30 21:17:27');
INSERT INTO `common_tools` VALUES (28, 'http://localhost:9090/files/20250401/8bdda97a63e34ebfb9df24b3e2dbde3c.png', 'Json工具—在线图片背景透明', '在不使用制图工具的情况下，使用 在线图片背景透明工具可以在 几秒钟内清除图像的背景。 如何使用在线图片背景透明 上传需要透明背景的图片。', 'https://www.jsongj.com/img/transparent', '图片处理工具', '2025-04-01 14:42:30', '2025-04-01 20:04:42');
INSERT INTO `common_tools` VALUES (29, 'http://localhost:9090/files/20250407/1a87c6afeae343fb8d5584b9215f6d5d.jpg', 'Namelix', 'Namelix 人工智能品牌名称生成器，你只需要输入你企业关键字，Namelix 就可以通过先进的语言模型生成朗朗上口的品牌名称，可以设置随机性，如果想要避免品牌冲突，可以选择高随机性，会有更多创意想法供你选择。', 'https://namelix.com/', '品牌名称生成器', '2025-04-07 21:36:30', '2025-04-07 21:36:30');

-- ----------------------------
-- Table structure for community_site
-- ----------------------------
DROP TABLE IF EXISTS `community_site`;
CREATE TABLE `community_site`  (
  `id` int NOT NULL AUTO_INCREMENT,
  `icon` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '图标URL',
  `name` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '网站名称',
  `description` text CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL COMMENT '网站描述',
  `url` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '网站链接',
  `category` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '分类:技术交流,学术交流,求职就业,校园生活',
  `create_time` datetime NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `update_time` datetime NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 7 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci COMMENT = '社区交流网站表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of community_site
-- ----------------------------
INSERT INTO `community_site` VALUES (1, '/files/20250331/7075af46d1e84778a01dc19fc6a2a823.jpg', 'CSDN', 'CSDN（中国开发者网络）成立于1999年，是中国最大的IT技术社区之一，涵盖博客、论坛、问答、代码托管等服务，拥有海量技术文章和活跃开发者社群，适合程序员学习与交流', 'https://www.csdn.net', '技术交流', '2025-03-31 20:54:22', '2025-03-31 20:54:22');
INSERT INTO `community_site` VALUES (2, '/files/20250331/c27c353b1d6c485baf8e92d1baecfaa1.jpg', '知乎', '中文互联网高质量问答社区，聚集各领域专业人士分享知识，以\"有问题，就会有答案\"为核心理念。2025年月活用户超8140万，支持图文/视频/直播等多形式内容创作。', 'http://www.zhihu.com', '校园生活', '2025-03-31 21:08:19', '2025-03-31 21:08:19');
INSERT INTO `community_site` VALUES (3, '/files/20250331/f99d88c3f0fd4c3084a22c3db9a5016a.png', '51CTO', '中国领先的IT技术社区与数字化学习平台，2005年成立，拥有2000万注册用户。提供云计算、AI、网络安全等3.2万+课程，与华为鸿蒙深度合作，服务企业及个人技能提升', 'http://www.51cto.com', '技术交流', '2025-03-31 21:11:23', '2025-03-31 21:11:23');
INSERT INTO `community_site` VALUES (4, '/files/20250331/57c36cfbc6cb408b9b5970674854face.jpg', '稀土掘金', '中国领先的开发者技术社区，成立于2015年，2025年迎来十周年升级。聚焦前沿技术分享与开发者成长，提供AI驱动的个性化内容推荐、职业发展支持及全球化交流平台。', 'https://juejin.cn', '技术交流', '2025-03-31 21:15:49', '2025-03-31 21:15:49');
INSERT INTO `community_site` VALUES (5, '/files/20250331/f436553ba56d408c9b0ffe7447e6efff.png', '小木虫', '中国领先的学术科研社区，2001年创立，专注化学、材料、生物等理工学科，提供文献求助、SCI期刊点评、考研调剂等实用服务。2025年注册用户超369万，日均活跃以高校硕博生为主，保持非营利性学术论坛特色。', 'https://muchong.com/', '学术交流', '2025-03-31 21:18:04', '2025-03-31 21:18:04');
INSERT INTO `community_site` VALUES (6, '/files/20250331/0a95a9ecf13f49628886dd336f5622f7.jpg', 'Quora', '全球知名问答平台，2009年由Facebook前员工创立，被誉为“美版知乎”', 'https://www.quora.com', '校园生活', '2025-03-31 21:21:52', '2025-03-31 21:21:52');

-- ----------------------------
-- Table structure for data_analysis
-- ----------------------------
DROP TABLE IF EXISTS `data_analysis`;
CREATE TABLE `data_analysis`  (
  `id` int NOT NULL AUTO_INCREMENT,
  `icon` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '图标URL',
  `name` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '网站名称',
  `description` text CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL COMMENT '网站描述',
  `url` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '网站链接',
  `is_free` tinyint(1) NULL DEFAULT 1 COMMENT '是否免费:0-付费,1-免费',
  `create_time` datetime NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `update_time` datetime NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 19 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci COMMENT = '数据分析工具表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of data_analysis
-- ----------------------------
INSERT INTO `data_analysis` VALUES (1, '/files/20250402/baa7dacb8c39465b904503a208223e94.png', 'OriginLab', '全球公司、大学和政府研究实验室的100多万注册用户依靠Origin来导入、绘制、探索、分析和解释他们的数据.', 'https://www.originlab.com/', 1, '2025-04-02 10:55:15', '2025-04-02 10:55:15');
INSERT INTO `data_analysis` VALUES (2, '/files/20250402/fc098ba13b164683bdc499de080369fc.png', 'Blender', 'Blender是一款自由和开源的三维计算机图形软件，它可以用于创建和渲染三维模型、动画、游戏、视觉效果等。', 'https://www.blender.org/', 1, '2025-04-02 10:57:12', '2025-04-02 10:57:12');
INSERT INTO `data_analysis` VALUES (3, '/files/20250402/a3a3dda0d88b48a89f9a74443eb1914d.png', 'Graphpad', '分析、绘制和展示您的科学工作。为什么选择 Prism？专为科学家而非统计学家打造的多功能统计工具。', 'https://www.graphpad.com/', 0, '2025-04-02 11:05:32', '2025-04-02 11:05:32');
INSERT INTO `data_analysis` VALUES (4, '/files/20250402/0f357c565a5848f48284c49a47a15490.png', 'ChatExcel', 'ChatExcel AI Excel处理和数据分析 用户只需像和好友聊天一样操作，Chatexcel会自动通过 AI完成图表处理和分析，彻底改变了与表格数据的交互方式。', 'https://chatexcel.com/#/', 1, '2025-04-02 11:11:30', '2025-04-02 11:11:30');
INSERT INTO `data_analysis` VALUES (5, '/files/20250402/be18d0ec1f504ceaad1d13c99540e722.png', 'Apache Echarts', 'ApacheECharts，一款基于JavaScript的数据可视化图表库，提供直观，生动，可交互，可个性化定制的数据可视化图表.', 'https://echarts.apache.org/zh/index.html', 1, '2025-04-02 11:14:20', '2025-04-02 11:14:20');
INSERT INTO `data_analysis` VALUES (6, '/files/20250402/5c38bce3679442a0baa92d6700444bb5.png', 'DataEase', 'DataEase 是开源的数据可视化分析工具，帮助用户快速分析数据并洞察业务趋势，从而实现业务的改进与优化。DataEase 支持丰富的数据源连接，能够通过拖拉拽方式快速制作图表，并可以方便地与他人分享。', 'https://dataease.io/index.html', 1, '2025-04-02 11:16:19', '2025-04-02 11:16:19');
INSERT INTO `data_analysis` VALUES (7, '/files/20250402/137b9ea03679467ea31b798557e07d21.png', 'FineBI', 'FineBI是一款强大好用，人人可用的大数据分析工具，可连接多种数据源，一键接入数据库表或导入Excel，可视化编辑数据，过滤合并计算等', 'https://www.finebi.com/', 1, '2025-04-02 11:19:20', '2025-04-02 11:19:20');
INSERT INTO `data_analysis` VALUES (8, '/files/20250402/7ccae523d408402ab6a3203b48014321.png', 'FinChat', 'FinChat是一个基于AI技术的金融数据分析平台，提供全球股票、ETFs和基金的覆盖，以及财务报告、市场估算、公司细分和关键绩效指标（KPIs）等数据。 ', 'https://finchat.io/', 1, '2025-04-02 21:57:40', '2025-04-02 21:57:40');
INSERT INTO `data_analysis` VALUES (9, '/files/20250402/69248a8e42dc48779e81b5d33f1160de.jpg', 'Excelformulabot', 'Excelformulabot是一款可以将文本指令转换为Excel公式的人工智能工具，支持sql指令，简化数据分析和报表制作。', 'https://app.formulabot.com/ai-excel-formula-generator', 1, '2025-04-02 22:01:27', '2025-04-02 22:01:27');
INSERT INTO `data_analysis` VALUES (10, '/files/20250405/b8af23fe780c4545b7b7b623e0dbf154.png', 'Rows', ' Rows，这是在电子表格上导入、转换和共享数据的最简单方法。构建连接到您的来源的实时数据报告，并使用 AI 自动进行数据分析。', 'https://rows.com/', 1, '2025-04-05 13:53:58', '2025-04-05 13:53:58');
INSERT INTO `data_analysis` VALUES (11, '/files/20250405/411c9f614a2c4ef8b2dd887fa5cc479a.png', '北极九章', '北极九章通过打造人人可用的AI数据洞察引擎DataGPT，致力于让数据触手可及，成为真正的生产力和创造力。', 'https://datarc.cn/', 1, '2025-04-05 13:56:28', '2025-04-05 13:56:28');
INSERT INTO `data_analysis` VALUES (12, '/files/20250405/d98206eedf3e4182b3b39fdc470c1b59.png', 'Vika维格云', '一键训练AI的多维表格，将表格数据训练成AI客服、AI线索收集器、数据分析师和更懂你的GPT。', 'https://vika.cn/', 1, '2025-04-05 13:59:00', '2025-04-05 13:59:00');
INSERT INTO `data_analysis` VALUES (13, '/files/20250405/a2dc3cac6b204e68a829140c2796bcf1.jpg', '百度GBI', ' 百度GBI是一款由百度推出的AI大模型商业分析工具，通过对话式交互实现数据分析，无需编写SQL语句。 它支持多种数据格式，提供过程透明、结果可信的分析服务，并能快速适配业务系统，生成深度洞见。', 'https://gbi.cloud.baidu.com/', 1, '2025-04-05 14:01:08', '2025-04-05 14:01:08');
INSERT INTO `data_analysis` VALUES (14, '/files/20250405/51720fb6cc27479b96a5029e665e6cc1.jpg', 'Ajelix', 'Ajelix 是一款 AI 数据分析整理工具，它可以分析用户提供的繁杂的数据文件， 并将其中有意义的重要数据整理成以具有专业外观的图形或表格，并将其整理成一个高级的可视化仪表盘', 'https://ajelix.com/', 1, '2025-04-05 14:04:54', '2025-04-05 14:04:54');
INSERT INTO `data_analysis` VALUES (15, '/files/20250407/c64e0dcf788c41fe9b84ea05f8b5216e.png', 'ImageGP', '在使得科研作图更简单更细腻的网站。主要包括以下作图类型：折线图、GO富集、热图、密度图、主成分分析图、桑基图、LEFSe图等等。这个网站使用方便，作图精美，而且不需要了解任何代码，对小白来说很友好，是可以收藏使用的。', 'https://www.bic.ac.cn/ImageGP/', 1, '2025-04-07 21:47:21', '2025-04-07 21:47:21');
INSERT INTO `data_analysis` VALUES (16, '/files/20250407/7f80817ea2374df3b9d2ff0fd454b01a.png', '基迪奥云平台', '部分需要付费，价格低廉，有近200种数据分析及作图。此外大多数生信公司都有数据处理云平台，内容基本大同小异', 'https://www.omicshare.com/tools/Home/Soft/getsoft', 1, '2025-04-07 21:49:15', '2025-04-07 21:49:15');
INSERT INTO `data_analysis` VALUES (17, '/files/20250408/3ebcc3cbcbf947e4baf3e964f5defb91.png', 'Chiplot', 'Chiplot是一个强大、易于使用的在线可视化工具，能够帮助用户快速创建交互式图表和数据可视化，并与团队成员共享和协作。', 'https://www.chiplot.online/#Phylogenetic-Tree', 1, '2025-04-08 10:22:34', '2025-04-08 10:22:34');
INSERT INTO `data_analysis` VALUES (18, '/files/20250408/360421aec14a4156b7afe0e0d872708a.png', '花火数图', '花火hanabi是数可视官网提供的一款简单易用的数据可视化工具，支持多种动静态图表和数据视频的制作和分享。', 'https://hanabi.cn/h2/basicChart', 1, '2025-04-08 10:25:54', '2025-04-08 10:25:54');

-- ----------------------------
-- Table structure for feedback
-- ----------------------------
DROP TABLE IF EXISTS `feedback`;
CREATE TABLE `feedback`  (
  `id` bigint NOT NULL AUTO_INCREMENT COMMENT '主键ID',
  `type` tinyint NOT NULL COMMENT '反馈类型：1-功能建议，2-问题反馈，3-其他',
  `content` text CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '反馈内容',
  `contact_info` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '联系方式',
  `status` tinyint NOT NULL DEFAULT 0 COMMENT '状态：0-待处理，1-已处理',
  `create_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `update_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 3 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci COMMENT = '用户反馈表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of feedback
-- ----------------------------
INSERT INTO `feedback` VALUES (1, 1, '不错', '', 1, '2025-04-15 19:53:54', '2025-04-15 19:53:54');
INSERT INTO `feedback` VALUES (2, 2, '有些卡片宽度不一致，影响观感', '13317321987', 0, '2025-04-15 20:43:03', '2025-04-15 20:43:03');

-- ----------------------------
-- Table structure for file_convert_tools
-- ----------------------------
DROP TABLE IF EXISTS `file_convert_tools`;
CREATE TABLE `file_convert_tools`  (
  `id` int NOT NULL AUTO_INCREMENT,
  `icon` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '工具图标',
  `name` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '工具名称',
  `description` text CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL COMMENT '工具描述',
  `url` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '工具链接',
  `supported_formats` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '支持格式',
  `create_time` datetime NULL DEFAULT NULL COMMENT '创建时间',
  `update_time` datetime NULL DEFAULT NULL COMMENT '更新时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 13 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci COMMENT = '文件格式转换工具' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of file_convert_tools
-- ----------------------------
INSERT INTO `file_convert_tools` VALUES (1, '/files/20250330/d413d7b420e0420d962b84e2db9b867b.png', '快用PDF', '快用PDF在线工具,20多项转换功能，包含在线转换pdf 免费、pdf文档转换PDF图片转换，文件压缩等，多种文件格式互转PDF在线转换pdf 免费,在线转换。', 'https://www.kypdf.com/', 'PDF，DOC，PPT等', '2025-03-30 20:26:58', '2025-03-30 20:26:58');
INSERT INTO `file_convert_tools` VALUES (2, '/files/20250330/8ba6a5be74804741ab7d6eb04f74c113.png', 'Online File Converter', '使用多个开源项目搭建的在线文件转换器。 无需注册会员，完全免费，用完就删！ 将文件从一种格式转换为另一种格式，例如Word转PDF、PDF转JPG、EPUB转MOBI', 'https://cdkm.com/cn/', 'PDF，Word，JPG，PNG等', '2025-03-30 20:32:36', '2025-03-30 20:32:36');
INSERT INTO `file_convert_tools` VALUES (4, '/files/20250330/0701b66b301c4452a6f78626d5c3b147.png', 'convertio', 'Convertio - 在线转换文件的简单工具。 支持超过309种不同的文档、图像、电子表格、电子书、文档、演示文稿、音频和视频格式。', 'https://convertio.co/', 'JPG，Xlsx，Doc，PNG', '2025-03-30 20:38:28', '2025-03-30 20:46:05');
INSERT INTO `file_convert_tools` VALUES (5, '/files/20250330/c0ff6c4a87d841bfb53105324633aa74.png', 'GroupDocs', '您可以从任何平台（Windows、Linux、macOS）转换您的 MD 文档。 无需注册。 只需将您的 MD 文件拖放到上传表单上，选择所需的输出格式，然后单击转换按钮即可。 转换完成后，您可以下载您的 PDF 文件。', 'https://products.groupdocs.app/zh/conversion/md-to-pdf', 'md，PDF', '2025-03-30 20:51:06', '2025-03-30 20:51:06');
INSERT INTO `file_convert_tools` VALUES (6, '/files/20250330/700cd89df59f419189111ea11b730ac1.png', 'ALL TO ALL', '本网站提供免费的md转所有格式的在线工具，支持最大10M的文件，无需下载或安装任何程序。提供免费格式转换工具列表，包括视频格式，音频格式，常用文档和图片格式等的转换。', 'https://www.alltoall.net/', 'md，PDF，DOC等', '2025-03-30 20:54:23', '2025-03-30 20:55:39');
INSERT INTO `file_convert_tools` VALUES (7, '/files/20250330/7523b8a017dc489f9017dfa56ccfd943.png', 'Compress2Go', ' Compress2Go 是一个在线文件压缩工具，可以减小文档，图像，视频，PNG，JPG，GIF，SVG等文件的大小。您可以选择不同的压缩级别，创建ZIP文件，或者查看教程，博客，媒体等资源。', 'https://www.compress2go.com/zh', 'PNG，JPG，GIF，SVG等', '2025-03-30 20:58:48', '2025-03-30 20:58:48');
INSERT INTO `file_convert_tools` VALUES (8, '/files/20250330/c07b9693ea4f495fbeac7b7bfc57e9a6.png', 'wecompress', '压缩 PDF、PowerPoint、Word、Excel、JPEG、PNG 和 TIFF 文件', 'https://www.wecompress.com/zh-Hans/', 'PDF、PowerPoint、Word等', '2025-03-30 21:01:26', '2025-03-30 21:01:26');
INSERT INTO `file_convert_tools` VALUES (9, '/files/20250330/f7cbb7ee05b74e76aece152944d50365.png', 'youcompress', 'YouCompress 是一个免费的在线文件压缩工具，支持 MP4、MOV、MP3、PDF、PNG、JPG、JPEG、GIF 等多种文件类型。无需注册，无需安装软件，无需添加水印，只需上传文件，就能快速压缩文件大小。', 'https://www.youcompress.com/zh-cn/', 'PNG、JPG、JPEG、GIF 等', '2025-03-30 21:03:18', '2025-03-30 21:03:18');
INSERT INTO `file_convert_tools` VALUES (10, '/files/20250330/81ad335e22434728a28496dacc857e0d.png', 'FileFormat', '免费的在线压缩器，可减少您的 Word、Excel、Powerpoint、图像文件的大小并保持良好的质量。 没有文件大小限制，获得相同的文件质量但更小。', 'https://products.fileformat.app/zh/compress/', 'Word、Excel、Powerpoint等', '2025-03-30 21:05:16', '2025-03-30 21:05:16');
INSERT INTO `file_convert_tools` VALUES (11, '/files/20250330/60311dabb14748c497c2604e62f27189.png', '在线ZIP压缩', '在线ZIP压缩工具，可以在浏览器中打开文件或文件夹，生成ZIP压缩文件，不需要上传到云端。支持多选文件，设置压缩级别，记录文件属性等功能。', 'https://www.lddgo.net/file/zip', 'PDF，DOC，Zip', '2025-03-30 21:07:51', '2025-03-30 21:07:51');
INSERT INTO `file_convert_tools` VALUES (12, '/files/20250401/759bfb1069c747f3811fd5b8bc6a9323.png', 'Json工具—在线图片背景透明', '在不使用制图工具的情况下，使用 在线图片背景透明工具可以在 几秒钟内清除图像的背景。 如何使用在线图片背景透明 上传需要透明背景的图片', 'https://www.jsongj.com/img/transparent', 'gif，svg，png等等', '2025-04-01 14:43:49', '2025-04-01 14:43:49');

-- ----------------------------
-- Table structure for font_icon
-- ----------------------------
DROP TABLE IF EXISTS `font_icon`;
CREATE TABLE `font_icon`  (
  `id` int NOT NULL AUTO_INCREMENT,
  `icon` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '图标URL',
  `name` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '网站名称',
  `description` text CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL COMMENT '网站描述',
  `url` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '网站链接',
  `is_free` tinyint(1) NULL DEFAULT 1 COMMENT '是否免费:0-付费,1-免费',
  `create_time` datetime NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `update_time` datetime NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 9 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci COMMENT = '字体图标工具表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of font_icon
-- ----------------------------
INSERT INTO `font_icon` VALUES (1, '/files/20250408/f73fbb5692fa46459dd14d435c5f79ab.jpg', 'iconfont-阿里巴巴矢量图标库', '设计师将图标上传到 iconfont 平台，用户可以自定义下载多种格式的icon，平台也可将图标转换为字体，便于前端工程师自由调整与调用。', 'https://www.iconfont.cn/', 1, '2025-04-08 10:48:38', '2025-04-08 10:48:38');
INSERT INTO `font_icon` VALUES (2, '/files/20250408/7fcc9fbed8804a37bc374746e0bff68c.png', 'Fontawesome中文网', '使用您自己的设计以及六种独特样式中的每一种的数千个匹配的字体真棒图标。 非常适合内容创作者。', 'https://fontawesome.com.cn/v5', 1, '2025-04-08 10:51:29', '2025-04-08 10:51:29');
INSERT INTO `font_icon` VALUES (3, '/files/20250408/fe693730ed44462fa6dcf255980600d1.jpg', 'Fontello - 在线图标字体工具', 'Fontello 是一个在线图标字体工具，提供数千个图标供用户选择，并支持根据需求进行调整和编辑，或者通过拖放自定义的 SVG 图标或 SVG 字体文件来添加用户自定义的图标，并将它们打包成一个自定义的字体文件，支持包括 TTF、EOT、WOFF 和 SVG 多种格式的字体文件。', 'https://fontello.com/', 1, '2025-04-08 10:55:41', '2025-04-08 10:55:41');
INSERT INTO `font_icon` VALUES (4, '/files/20250408/5c3b4035c19c42ac9d0b4adca62b3a16.png', 'Ionicons', 'Ionicons 是一个国外知名混合开发框架 Ionic Framework 内置的图标库。 它包含 1300 个为 Web、iOS、Android 和桌面应用程序专门定制的图标。', 'https://ionic.io/ionicons', 1, '2025-04-08 10:59:33', '2025-04-08 10:59:33');
INSERT INTO `font_icon` VALUES (5, '/files/20250408/f51eda62b37548319d4458fb6c055735.jpg', 'Bootstrap Icons', 'Bootstrap 官方图标库 包含 1800 多个图标的免费、高质量的开源图标库。 你可以以任何方式使用它们，例如 SVG 矢量图、SVG sprite 或 web 字体形式。', 'https://icons.getbootstrap.com/', 1, '2025-04-08 11:02:35', '2025-04-08 11:02:35');
INSERT INTO `font_icon` VALUES (6, '/files/20250408/c3c19fd23ec34e959a6ea3ee132a4d18.png', 'flag-icons', 'flag-icons 是一个包，它以 SVG 格式提供所有国家/地区国旗和一个 CSS 文件，以便于集成。您可以将标志与文本一起使用或用作任何元素的背景', 'https://www.flaticon.com/free-icons/flag', 1, '2025-04-08 11:05:44', '2025-04-08 11:05:44');
INSERT INTO `font_icon` VALUES (7, '/files/20250408/192fae8db76c47b4abcf2e1a838944e4.png', 'Material Design 图标', 'MDI 是一个开源图标库，拥有 7200 多个图标，遵循 Google 的 Material Design 指南。您可以在设计和开发中使用 MDI，或者在 GitHub 上建议和贡献新图标。', 'https://pictogrammers.com/library/mdi/', 1, '2025-04-08 11:09:13', '2025-04-08 11:09:13');
INSERT INTO `font_icon` VALUES (8, '/files/20250408/ce67e77b155f4066ba5d9f7d9984d9f2.png', '字体图标在线工具箱', 'Bootstrap 官方图标库,包含 1800 多个图标的免费、高质量的开源图标库。 你可以以任何方式使用它们，例如 SVG 矢量图、SVG sprite 或 web 字体形式。', 'https://www.idcd.com/icons', 1, '2025-04-08 11:11:22', '2025-04-08 11:11:22');

-- ----------------------------
-- Table structure for image_drawing
-- ----------------------------
DROP TABLE IF EXISTS `image_drawing`;
CREATE TABLE `image_drawing`  (
  `id` int NOT NULL AUTO_INCREMENT,
  `icon` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '图标URL',
  `name` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '网站名称',
  `description` text CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL COMMENT '网站描述',
  `url` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '网站链接',
  `is_free` tinyint(1) NULL DEFAULT 1 COMMENT '是否免费:0-付费,1-免费',
  `create_time` datetime NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `update_time` datetime NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 15 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci COMMENT = '图像绘画工具表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of image_drawing
-- ----------------------------
INSERT INTO `image_drawing` VALUES (1, '/files/20250407/ae1c0f06ffe64bcfa0f8e8181c467e3f.png', 'Reve Image （Halfmoon）', 'Reve Image （Halfmoon）：一种经过全面训练的模型，在及时遵守、美学和排版方面表现出色。使用 Reve 制作您能想象到的任何图像。', 'https://preview.reve.art/app', 1, '2025-04-07 20:21:03', '2025-04-07 20:21:03');
INSERT INTO `image_drawing` VALUES (2, '/files/20250407/cfe402b525394feda5a049133cd8e828.png', 'Reve AI', '使用免费的文本到图像生成器在线创建 AI 图像，基于 Reve Image 1.0 模型，将文本提示转化为惊艳的视觉效果。', 'https://reveai.org/zh', 1, '2025-04-07 20:22:11', '2025-04-07 20:22:11');
INSERT INTO `image_drawing` VALUES (3, '/files/20250407/6d0740572228401b908a53f7c2d5d88f.png', 'WHEE', 'WHEE是一款AI绘画与图片生成器，提供一站式AI视觉创作服务。WHEE不仅会画也会修图，各种AI修图功能一应俱全。使用门槛低。', 'https://www.whee.com/', 1, '2025-04-07 20:23:35', '2025-04-07 20:23:35');
INSERT INTO `image_drawing` VALUES (4, '/files/20250407/442aea8dd1104841ad59b9a5d43c8e38.png', '绘蛙', '绘蛙，阿里巴巴集团推出的AI电商营销神器，助您高效创作。 AI生成商拍图、种草文案，轻松美化设计，提升商品展示。 适合电商商家、社交媒体达人、内容创作者，助您脱颖而出。', 'https://www.ihuiwa.com/', 1, '2025-04-07 20:38:37', '2025-04-07 20:38:37');
INSERT INTO `image_drawing` VALUES (5, '/files/20250407/a3f3ba7691784d6eb14d0afb464d674c.png', 'HivisionIDPhoto ', 'HivisionIDPhoto 是一款基于 AI 的轻量级证件照制作工具，能智能识别和抠图，快速生成符合多种规格的证件照。 支持自定义背景色和尺寸，未来还将推出美颜和智能换正装功能。', 'https://swanhub.co/ZeYiLin/HivisionIDPhotos/demo', 1, '2025-04-07 20:42:18', '2025-04-07 20:42:18');
INSERT INTO `image_drawing` VALUES (6, '/files/20250407/888e07b464714f17a16c428bdc833a6e.jpg', 'Dashtoon Studio', 'Dashtoon Studio，AI漫画工厂，借助先进的AI漫画创建工具，轻松将您的故事转化为引人入胜的漫画和漫画。', 'https://dashtoon.com/create', 1, '2025-04-07 20:44:17', '2025-04-07 20:44:17');
INSERT INTO `image_drawing` VALUES (7, '/files/20250407/b8fab216dd7048c79226e0524fa63cec.jpg', 'Playground AI', 'Playground AI是一个基于Stable Diffusion XL和自研模型的AI图像生成平台，提供文本到图片、图片到图片、图像编辑等功能，支持商用。每月免费生成1000张绘画', 'https://playground.com/', 1, '2025-04-07 20:46:51', '2025-04-07 20:46:51');
INSERT INTO `image_drawing` VALUES (8, '/files/20250407/0384d870af054d05a3187fcb3137936e.png', 'Vega AI', 'Vega 是一款强大的在线创作工具：操作流程更加简化，能够更好更快地创作内容; 几分钟内构思，快速生成高质量的画面 支持在线快速训练，自由定制;', 'https://www.vegaai.net/', 1, '2025-04-07 20:49:46', '2025-04-07 20:49:46');
INSERT INTO `image_drawing` VALUES (9, '/files/20250407/607807f98e41428584e0fa4fe8b23ead.png', 'Quick QR Art', 'Quick QR Art是一个由Pixel ML, Inc.开发的AI工具，它能够帮助用户创建、定制和跟踪令人惊叹的QR码艺术。 这款工具的核心功能在于将传统的QR码转化为具有艺术性的设计。', 'https://quickqr.art/?lang=zh-CN', 1, '2025-04-07 20:51:53', '2025-04-07 20:51:53');
INSERT INTO `image_drawing` VALUES (10, '/files/20250407/dee616b7dd2142a0b058b34f65602932.png', '秒画', '会打字就会用的AI绘画神器，完美支持中文提示词，支持摄影、可爱、精致、赛博朋克、电影等超多风格，人人都可以是插画师！ 快速创作二次元、写实向等多种风格小姐姐！', 'https://miaohua.sensetime.com/', 1, '2025-04-07 20:55:28', '2025-04-07 20:55:28');
INSERT INTO `image_drawing` VALUES (11, '/files/20250407/aeb469defb0745418ba4c4fa9772ba79.jpg', 'Midjourney', 'MJ绘画 AI让绘画如此简单,快速出图.MJ绘画中文站,为用户提供一站式服务体验! midjourney 官网-MJ绘画 中国—智能AI绘图生成工具,输入关键词就能自动生成精美图片', 'https://mj.qihuiai.com/', 1, '2025-04-07 21:15:58', '2025-04-07 21:15:58');
INSERT INTO `image_drawing` VALUES (12, '/files/20250407/7b82d3b6b40741a9b695fde9f1d82b33.png', 'Skybox AI', 'Skybox AI 是一款 AI 驱动的工具，可让您使用文本提示或您自己的图像创建和重新混合 360° 全景世界。您可以将天空盒导出为 3D 网格、HDRI 等，用于 3D 项目。', 'https://www.skyboxai.net/', 1, '2025-04-07 21:27:18', '2025-04-07 21:27:18');
INSERT INTO `image_drawing` VALUES (13, '/files/20250407/f507683dbd4742cca1b82b0cbf23dd1c.jpeg', '神采', '神采AI拥有强大的人工智能驱动设计助手和广泛可控的AIGC（C-AIGC）模型风格库，使你能够轻松地创造出令人惊叹的图形、视频和动画。', 'https://www.promeai.pro/zh-CN', 1, '2025-04-07 21:31:15', '2025-04-07 21:31:15');
INSERT INTO `image_drawing` VALUES (14, '/files/20250407/c742484e1a1a441aacd1c63c4dec9563.png', '造梦日记', '造梦日记，原名盗梦师，是西湖心辰联合西湖大学研发的一款AI绘画工具，覆盖多模态模型训练和图像生成，包括二次元头像生成、图片设计等', 'https://zmrj.art/', 1, '2025-04-07 21:33:30', '2025-04-07 21:33:30');

-- ----------------------------
-- Table structure for law_assistant
-- ----------------------------
DROP TABLE IF EXISTS `law_assistant`;
CREATE TABLE `law_assistant`  (
  `id` int NOT NULL AUTO_INCREMENT,
  `icon` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '图标URL',
  `name` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '网站名称',
  `description` text CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL COMMENT '网站描述',
  `url` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '网站链接',
  `is_free` tinyint(1) NULL DEFAULT 1 COMMENT '是否免费:0-付费,1-免费',
  `create_time` datetime NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `update_time` datetime NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 10 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci COMMENT = 'AI法律助手表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of law_assistant
-- ----------------------------
INSERT INTO `law_assistant` VALUES (1, '/files/20250401/e8849297ae7d4b6db86559f658652d76.png', 'ChatLaw', 'ChatLaw是由北京大学团队开发的中文法律大模型，旨在为法律从业者和普通用户提供高效的法律服务支持。它具备法律咨询、文书生成、信息抽取等功能，基于亿级法律语料训练，可处理复杂法律场景。', 'https://chatlaw.cloud/', 1, '2025-04-01 10:12:30', '2025-04-01 10:12:30');
INSERT INTO `law_assistant` VALUES (2, '/files/20250402/92d02d5e63c645f68f23704edc0aa1d5.png', 'DoNotPay', 'DoNotPay是世界上第一个AI驱动的机器人律师平台，通过自动化法律文件生成、取消订阅、退款申请和隐私保护等功能，让复杂的法律程序变得简单易懂。 ', 'https://donotpay.com/', 1, '2025-04-02 22:05:16', '2025-04-02 22:05:16');
INSERT INTO `law_assistant` VALUES (3, '/files/20250402/02278b297f1145d7a78006f640708cb5.jpg', '元典智库', '元典智库是一款面向律师、企业法务、法学师生、法官和检察官等专业法律人提供的一站式法律知识服务平台，收录法律法规文件超过400余万份、公开裁判文书1.5亿余篇。', 'https://www.chineselaw.com/tyjs/index', 1, '2025-04-02 22:08:24', '2025-04-02 22:08:24');
INSERT INTO `law_assistant` VALUES (4, '/files/20250402/1b3c384b62f249d7b7cd11c865e9881d.jpg', '通义法睿', '阿里云通义法睿是专门面向法律领域的行业垂类大模型产品，拥有法律的理解和推理能力，能够回答法律问题、推理法律适用、推送裁判类案、辅助案情分析、生成法律文书、检索法律知识。', 'https://tongyi.aliyun.com/farui', 1, '2025-04-02 22:10:26', '2025-04-02 22:10:26');
INSERT INTO `law_assistant` VALUES (5, '/files/20250402/6fa31ceea50b41d185c6bc6acd517db6.jpg', '法行宝', '法行宝是百度旗下的智能法律服务对话产品，通过最新的生成式技术和丰富的法律行业数据，为您提供法律问题解答、法律意见书生成、律师咨询等服务。', 'https://ailegal.baidu.com/', 1, '2025-04-02 22:11:41', '2025-04-02 22:11:41');
INSERT INTO `law_assistant` VALUES (6, '/files/20250402/6b134a101d014194baefb22100563e9c.png', '得理法搜', '得理法搜是一款专业的法律数据智能检索引擎，提供全域法律大数据、智能语义检索、一次检索多维呈现、AI阅读裁判文书、文本智能生成、AI法律研究、AI+律师法律咨询等功能。', 'https://data.delilegal.com/', 1, '2025-04-02 22:13:45', '2025-04-02 22:13:45');
INSERT INTO `law_assistant` VALUES (7, '/files/20250402/f5aaffb0c35c4e779c644c423c58a12c.png', '合同嗖嗖', '合同嗖嗖是一款基于人工智能技术的在线合同生成工具。 用户只需输入相关关键词，AI系统即可快速生成符合法律法规的合同文本，极大简化了合同的编写和审查过程。', 'https://contract.yoo-ai.com/', 1, '2025-04-02 22:15:46', '2025-04-02 22:15:46');
INSERT INTO `law_assistant` VALUES (8, '/files/20250403/efa0e100226c46f1a51d3664b02f6652.png', '法智AI', '法智AI是法律AI大模型、智能律师助理。 法智精准和全面地为用户提供一站式法律服务解决方案，满足检索、咨询、审查、分析、写作、谈判、记录等多种业务场景需求。', 'https://www.fazhi.law/law-saas/gpt', 1, '2025-04-03 09:31:45', '2025-04-03 09:31:45');
INSERT INTO `law_assistant` VALUES (9, '/files/20250403/f7d017ebd24141d7af4c4b79f2a14331.png', '海瑞智法', '海瑞智法利用AI大模型技术，为律师提供快速高效的法律检索和内容生成工具', 'https://www.hairuilegal.com/', 1, '2025-04-03 21:03:31', '2025-04-03 21:03:31');

-- ----------------------------
-- Table structure for math_model_tool
-- ----------------------------
DROP TABLE IF EXISTS `math_model_tool`;
CREATE TABLE `math_model_tool`  (
  `id` int NOT NULL AUTO_INCREMENT,
  `icon` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '图标URL',
  `name` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '工具名称',
  `description` text CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL COMMENT '工具描述',
  `url` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '官网链接',
  `category` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '分类:建模,编程,论文写作,数据分析',
  `create_time` datetime NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `update_time` datetime NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 27 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci COMMENT = '数学建模辅助工具表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of math_model_tool
-- ----------------------------
INSERT INTO `math_model_tool` VALUES (1, 'http://localhost:9090/files/20250331/0a177ead48fd4613aa6ff6ed8cac2e8f.png', '代码在线高亮工具', '用于代码突出显示的免费在线工具。您可以将突出显示的代码复制并粘贴到编辑工具中，例如 Microsoft Word 或 OneNote。', 'https://www.highlightcode.com/', '论文写作', '2025-03-31 20:00:34', '2025-03-31 20:00:34');
INSERT INTO `math_model_tool` VALUES (2, 'http://localhost:9090/files/20250401/01227b9a74f245c899e341b9d988e87b.jpg', 'SPSSPRO', 'SPSSPRO是一个免费专业易用的在线统计分析平台，拖拽即可得到分析结果，让统计分析更简单。SPSSPRO当前提供的分析方法包括频数分析,描述分析,正态性检验等等。', 'https://www.spsspro.com/', '数据分析', '2025-04-01 20:55:18', '2025-04-01 20:58:49');
INSERT INTO `math_model_tool` VALUES (3, 'http://localhost:9090/files/20250401/94ba4a08ad7f440c8f2f2cdca5a9f739.png', '数学中国网站', '数学中国网站是以数学中国社区为主体的综合性学术社区，下分建模、编程、学术理论、工程应用等版块。', 'http://www.madio.net/', '建模', '2025-04-01 20:58:42', '2025-04-01 20:58:42');
INSERT INTO `math_model_tool` VALUES (4, 'http://localhost:9090/files/20250401/74c3ed5fd07042ee82870c7f455b4003.png', '国家数据', '可视化统计图秉持方便易用的理念展示统计数字，通过简单的图像或动态界面及互动式统计图，您可更清楚了解一些统计指标。', 'https://data.stats.gov.cn/', '数据分析', '2025-04-01 21:01:01', '2025-04-01 21:01:01');
INSERT INTO `math_model_tool` VALUES (5, 'http://localhost:9090/files/20250401/a193e88326204deb897bcc610a8ee3be.png', 'CEIC', '195个国家400多万个时间序列的数据源ceicdata.com', 'https://www.ceicdata.com/', '数据分析', '2025-04-01 21:02:11', '2025-04-01 21:02:11');
INSERT INTO `math_model_tool` VALUES (6, 'http://localhost:9090/files/20250401/c0794c55b36848ce824bc7bd4b93e4d6.png', '谷歌学术', '借助 Google 学术搜索，您可以轻松地大范围搜索学术文献。 搜索范围囊括众多知识领域和来源：文章、论文、图书、摘要和法院判决意见书。', 'https://scholar.google.com.hk/?hl=zh-CN', '论文写作', '2025-04-01 21:03:14', '2025-04-01 21:03:14');
INSERT INTO `math_model_tool` VALUES (7, 'http://localhost:9090/files/20250401/24a436a0f4654735a4dcac03d298ee56.jpg', '中国知网', 'CNKI 为全球用户提供期刊、学位论文、年鉴、会议论文等中文学术资源的统一检索和发现服务。', 'https://www.cnki.net/', '论文写作', '2025-04-01 21:04:05', '2025-04-01 21:04:05');
INSERT INTO `math_model_tool` VALUES (8, 'http://localhost:9090/files/20250401/ce4bd7a58aa3493fab4054c7408eea66.jpg', '参考文献格式生成器', '可以给论文的参考文献进行格式生成。', 'http://youkud.com/tool/referance/index.html', '论文写作', '2025-04-01 21:05:54', '2025-04-01 21:05:54');
INSERT INTO `math_model_tool` VALUES (9, 'http://localhost:9090/files/20250401/c71873c288bb4d558da0e1ecceb5c50d.jpg', 'DeepL翻译', 'DeepL Translate 是一项免费的在线服务，使用 AI 翻译 33 种语言的文本、文件和语音。试用 DeepL Pro 以获得更多功能、数据安全和文档编辑。', 'https://www.deepl.com/zh/translator', '论文写作', '2025-04-01 21:07:19', '2025-04-01 21:07:19');
INSERT INTO `math_model_tool` VALUES (10, 'http://localhost:9090/files/20250401/ace933f8ca634a41be6df44e91d6b0aa.png', 'CodeInWord', 'CodeInWord - 简单易用的代码高亮工具，一键美化代码并完美兼容Word/WPS。 支持Python、Java、JavaScript等多种编程语言，所有操作均在浏览器本地完成，不保存任何用户数据。', 'https://www.codeinword.com/', '论文写作', '2025-04-01 21:09:44', '2025-04-01 21:09:44');
INSERT INTO `math_model_tool` VALUES (11, 'http://localhost:9090/files/20250401/81e1717f86234ae6aadb400b7c3de067.png', '代码在线高亮', '代码在线高亮，可以实现在线着色各种语言的代码，让代码看起来更美观。', 'https://www.jyshare.com/', '论文写作', '2025-04-01 21:12:05', '2025-04-01 21:12:05');
INSERT INTO `math_model_tool` VALUES (12, 'http://localhost:9090/files/20250401/50147e32ed4946f7b1e904986b90580e.png', '1024Tools', '代码高亮/着色、在线美化功能由 @highlight.js 提供， 编辑器由 @ace 提供', 'https://1024tools.com/', '论文写作', '2025-04-01 21:13:45', '2025-04-01 21:13:45');
INSERT INTO `math_model_tool` VALUES (13, 'http://localhost:9090/files/20250401/a8f8f431669e4181b2186c234f28fff8.png', 'CommandNotFound', 'CommandNotFound ⚡️ 坑否 ———— 中文，免费，零起点，帮助攻城狮们避免在技术上遇到各种坑！', 'https://commandnotfound.cn/tools/highlighter', '论文写作', '2025-04-01 21:15:50', '2025-04-01 21:15:50');
INSERT INTO `math_model_tool` VALUES (14, 'http://localhost:9090/files/20250401/c3d9ded755a7444a85b417fbd94bba9f.png', '在线代码高亮工具', '代码高亮工具,支持自动识别输入内容的语言。', 'https://www.68tools.com/highlight', '论文写作', '2025-04-01 21:19:45', '2025-04-01 21:19:45');
INSERT INTO `math_model_tool` VALUES (15, 'http://localhost:9090/files/20250401/9ce348a184e84d98855565a091751007.jpg', 'Geogebra', '在线免费的 GeoGebra 应用程序包: 将绘图, 几何, 代数, 3D, 统计, 概率等集成在一起!', 'https://www.geogebra.org/classic?lang=zh_CN', '建模', '2025-04-01 21:21:26', '2025-04-01 21:21:26');
INSERT INTO `math_model_tool` VALUES (16, 'http://localhost:9090/files/20250401/b331d3ea84ff45a499b1a2057dd157be.png', 'MathType', 'MathType是一款非常强大的数学公式编辑软件，兼容Office,Google Docs等700多种程序，用于编辑数学试卷、书籍、报刊、论文、幻灯演示等文档轻松输入各种复杂的数学公式和符号。', 'https://mathtype.org/download/', '论文写作', '2025-04-01 21:25:11', '2025-04-01 21:25:11');
INSERT INTO `math_model_tool` VALUES (17, 'http://localhost:9090/files/20250401/2815ba418866478785b94dd1f2596caa.png', 'AmyXun', 'AxMath/AxGlyph属于OLE（用来在WORD等容器中插入公式或图片对象）软件', 'https://www.amyxun.com/', '论文写作', '2025-04-01 21:27:57', '2025-04-01 21:27:57');
INSERT INTO `math_model_tool` VALUES (18, 'http://localhost:9090/files/20250401/2ae6d3360c6e424799f4b744a2b2135e.jpg', 'SSPS 在线数据分析软件', '统计分析软件,广泛应用于社会科学研究,提供数据管理、描述统计、推断统计、回归等-专业数据分析、科研绘图代做,助你解读研究成果!', 'https://spssai.statistical-analysis.top/', '建模', '2025-04-01 21:39:35', '2025-04-01 21:39:35');
INSERT INTO `math_model_tool` VALUES (19, 'http://localhost:9090/files/20250401/ffb7072b6cff443aafc9fe177d214601.png', 'DeepSeek', '\"DeepSeek是专注长文本和高效问答的中文AI助手。\"', 'https://chat.deepseek.com/', '编程', '2025-04-01 21:41:38', '2025-04-01 21:41:38');
INSERT INTO `math_model_tool` VALUES (20, 'http://localhost:9090/files/20250402/f791e02993ff44daaed8918eddf70ba2.png', 'Lingo', 'LINGO 是一款全面的工具，旨在帮助您快速、轻松、高效地构建和求解线性、非线性和整数优化模型。', 'https://www.lindo.com/', '建模', '2025-04-02 10:34:03', '2025-04-02 10:34:03');
INSERT INTO `math_model_tool` VALUES (21, 'http://localhost:9090/files/20250402/041c89e6e9724bc79e8e99f9ad13128c.png', 'Stata', '该软件的统计功能非常强大，里面可以直接绘制，百分比图、直方图、散点图', 'https://www.stata.com/', '建模', '2025-04-02 10:36:19', '2025-04-02 10:36:19');
INSERT INTO `math_model_tool` VALUES (22, '', '亿图脑图（MindMaster）', '思维导图软件，平时在进行数据分析或者进行文章阅读时，可以用这个软件', 'https://mm.edrawsoft.cn/app/create', '数据分析', '2025-04-02 10:40:35', '2025-04-02 10:40:35');
INSERT INTO `math_model_tool` VALUES (23, 'http://localhost:9090/files/20250402/9c2b459fca53461a89d84b750203aa34.jpg', '亿图图示', ' 思维导图软件，但相较于mindmaster功能会更多一点', 'https://www.edrawmax.cn/online/zh/', '数据分析', '2025-04-02 10:43:45', '2025-04-02 10:43:45');
INSERT INTO `math_model_tool` VALUES (24, 'http://localhost:9090/files/20250402/71b888577fd944799d9af299e6a93896.png', 'Wolfram Mathematica', '在计算机领域应用非常广泛、包括网络图像、几何数据、符号运算。功能对标matlab，但是目前没有matlab普及。', 'https://www.wolfram.com/mathematica/', '建模', '2025-04-02 10:46:59', '2025-04-02 10:46:59');
INSERT INTO `math_model_tool` VALUES (25, 'http://localhost:9090/files/20250402/62fb818bae294923a48a91d63dcaf9b5.jpg', 'Stylewriter', 'StyleWriter 软件是一款功能强大的手稿编辑器和英语语法检查器，可以识别和纠正数以千计的写作错误，包括复杂的单词、行话和摘要......', 'https://www.stylewriter-usa.com/', '论文写作', '2025-04-02 10:49:43', '2025-04-02 10:49:43');
INSERT INTO `math_model_tool` VALUES (26, 'http://localhost:9090/files/20250402/673d8175745d410cbd4b896dc73e9336.png', 'Visio', '数模竞赛中会用到的高频软件，主要用于绘制流程图和示意图.有破解版的，详见常用工具中的“软件管家”。', 'https://www.microsoft.com/zh-cn/microsoft-365/visio/flowchart-software', '论文写作', '2025-04-02 11:09:41', '2025-04-02 11:09:41');

-- ----------------------------
-- Table structure for notice
-- ----------------------------
DROP TABLE IF EXISTS `notice`;
CREATE TABLE `notice`  (
  `id` int NOT NULL AUTO_INCREMENT COMMENT '主键ID',
  `title` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '公告标题',
  `content` text CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '公告内容',
  `status` tinyint(1) NOT NULL DEFAULT 1 COMMENT '状态：1-已发布，0-草稿',
  `create_time` datetime NOT NULL COMMENT '创建时间',
  `update_time` datetime NOT NULL COMMENT '更新时间',
  `create_by` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '创建人',
  `update_by` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '更新人',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 3 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci COMMENT = '公告管理表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of notice
-- ----------------------------
INSERT INTO `notice` VALUES (1, '🚀 CampusToolBox 后台管理系统即将上线，敬请期待！', '尊敬的开发者/管理员：\n感谢您对 CampusToolBox 项目的关注与支持！我们正在全力打造一款高效、便捷的校园工具后台管理系统，目前系统已进入最后测试阶段，即将与您见面。', 1, '2025-04-09 19:53:29', '2025-04-09 19:53:29', 'mizhuo', 'mizhuo');
INSERT INTO `notice` VALUES (2, '欢迎大家给我提供建议', '本人是初学者，本项目是自己一个人做的，没有什么经验，项目仅供学习交流！', 1, '2025-04-09 20:50:28', '2025-04-10 16:04:28', 'mizhuo', 'mizhuo');

-- ----------------------------
-- Table structure for paper_check_tool
-- ----------------------------
DROP TABLE IF EXISTS `paper_check_tool`;
CREATE TABLE `paper_check_tool`  (
  `id` int NOT NULL AUTO_INCREMENT,
  `icon` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '图标URL',
  `name` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '工具名称',
  `description` text CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL COMMENT '工具描述',
  `url` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '官网链接',
  `pricing` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '价格信息',
  `create_time` datetime NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `update_time` datetime NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 13 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci COMMENT = '论文查重工具表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of paper_check_tool
-- ----------------------------
INSERT INTO `paper_check_tool` VALUES (1, 'http://localhost:9090/files/20250331/bc50bb6a017b4e63bfb75c20fef939e2.png', 'PaperPass', 'PaperPass权威中文论文查重系统，提供职称、课题、高校毕业论文检测服务，免费论文降重，快捷、精准、真实标红且提供详细相似来源及修改意见，并推出免费论文查重检测活动。', 'https://www.paperpass.com/', '免费版每天5篇', '2025-03-31 16:39:20', '2025-03-31 16:39:20');
INSERT INTO `paper_check_tool` VALUES (2, 'http://localhost:9090/files/20250331/f6d1ad88eb3942c989820e4c3de29686.png', '论文哥（PaperGe）', '论文哥免费论文查重检测，首款免费论文检测软件 ，为毕业生提供专业的论文查重，查重入口，查重软件，查重网站等一站式服务 ... 在线改重 论文 降重 论文纠错 PDF转换 论文翻译 答辩PPT', 'https://www.paperge.com/check-new', '每天免费查重一次，不限字数，报告详细', '2025-03-31 16:42:40', '2025-03-31 16:42:40');
INSERT INTO `paper_check_tool` VALUES (3, 'http://localhost:9090/files/20250331/46d61019170843b794858ff3cf896d8f.png', 'PaperYY', 'PaperYY每天免费查重一篇,不限字数.操作简单,填写题目上传论文,即可查重.结果和学校一致,支持真伪验证.带重复出处及修改建议,支持边查边改,查重过程全链条加密不收录.', 'https://www.paperyy.com/', '每天免费查重一篇,不限字数', '2025-03-31 16:46:29', '2025-03-31 16:46:29');
INSERT INTO `paper_check_tool` VALUES (4, 'http://localhost:9090/files/20250331/ab6ab922a6f94075b009ef3b7ae3fc24.png', 'PaperDay', 'PaperDay毕业季永久免费论文查重、每日不限篇数和字数，提供免费“查重、改重、降重、排版、纠错”一站式服务，论文在线降重实时同步反馈结果，PaperDay论文查重结果保障毕业更放心', 'https://www.paperday.cn/', '毕业季永久免费', '2025-03-31 16:48:57', '2025-03-31 16:48:57');
INSERT INTO `paper_check_tool` VALUES (5, 'http://localhost:9090/files/20250331/82b5bf28c75c4c34a3e9f18fcb7cbd3c.png', 'PaperDog', ' 论文免费查重PaperDog,每天免费检测一篇，无任何其他限制，支持一键智能降重改重！ 论文查重网站PaperDog采用阿里云认证的高防服务器，检测系统全程自动论文检测。', 'https://www.paperdog.net/', '每天免费检测一篇', '2025-03-31 16:51:56', '2025-03-31 16:51:56');
INSERT INTO `paper_check_tool` VALUES (6, 'http://localhost:9090/files/20250331/a51e0ed3e0e64e1281960460c1164250.jpg', 'PaperWord', 'PaperWord免费论文查重，每天免费查重一篇，一键论文降重达标，一次查重五个报告，不泄露不上传', 'https://www.paperword.com/', '每天免费查重一篇', '2025-03-31 16:55:46', '2025-03-31 16:55:46');
INSERT INTO `paper_check_tool` VALUES (7, 'http://localhost:9090/files/20250331/b942c76c11c34bd981c2fee2e5a03ec1.png', '大雅相似度分析', '大雅相似度分析系统，通过对上传文献的详细分析自动生成检测报告，报告包含全文检测详细报告、简洁报告、网页报告等多种格式报告单；用户可下载PDF报告和HTML报告进行查看和打印。', 'https://dsa.dayainfo.com/', '每日免费一次', '2025-03-31 16:58:59', '2025-03-31 16:58:59');
INSERT INTO `paper_check_tool` VALUES (8, 'http://localhost:9090/files/20250331/38745b5d83e445fc8488931b8e0d8ab0.png', '万方检测', '万方数据提供个人文献版、机构用户版、合作用户版等多种论文检测服务，支持新文献检测、已发表文献检测、批量上传、离线检测等功能。应届毕业生享万方免费查重一次', 'https://jc.wanfangdata.com.cn/index', '付费', '2025-03-31 17:03:04', '2025-03-31 17:03:04');
INSERT INTO `paper_check_tool` VALUES (9, 'http://localhost:9090/files/20250331/51d69bc2ad894f33b464083043b92bdb.png', 'PaperOK', '采用区块链安全技术，为数千万师生的知识产权保驾护航，安全论文查重上PaperOK。关注公众号，限制1万字免费查重', 'https://www.paperok.com/', '每日免费一次', '2025-03-31 17:04:41', '2025-03-31 17:04:41');
INSERT INTO `paper_check_tool` VALUES (10, 'http://localhost:9090/files/20250331/6f32ffd0c71447c3894410e53599e332.png', '维普论文检测系统', '维普论文查重检测平台，主要适用于：专本论文、研究生论文、职称期刊等论文查重，系统快速检测且不留痕迹，报告含真伪标识码，正品保证放心使用!', 'https://vpcs.fanyu.com/', '付费', '2025-03-31 17:09:03', '2025-03-31 17:09:03');
INSERT INTO `paper_check_tool` VALUES (11, 'http://localhost:9090/files/20250331/8f3ce5ed0d5e48f88150727c0e036487.jpg', '知网查重', '知网个人查重服务（知网AIGC检测）为您提供硕士论文查重、博士论文查重、本科论文查重、研究生毕业论文查重、论文AI检测、AIGC检测、期刊论文查重、毕业设计查重、专科论文查重', 'https://cx.cnki.net/main.html', '付费', '2025-03-31 17:12:41', '2025-03-31 17:12:41');
INSERT INTO `paper_check_tool` VALUES (12, 'http://localhost:9090/files/20250331/08b9288b719b4e5eab41774922228456.png', '源文鉴', '经过老师和同学们真实体验和反馈，源文鉴系统确实与知网检测相差不大，大家目前都在用，非常适合定稿查重，市面上接近知网系统，两者的数据库相似', 'https://www.yuanwenjian.net/', '付费', '2025-03-31 17:22:34', '2025-03-31 17:22:34');

-- ----------------------------
-- Table structure for ppt_tool
-- ----------------------------
DROP TABLE IF EXISTS `ppt_tool`;
CREATE TABLE `ppt_tool`  (
  `id` int NOT NULL AUTO_INCREMENT,
  `icon` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '图标URL',
  `name` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '网站名称',
  `description` text CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL COMMENT '网站描述',
  `url` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '网站链接',
  `is_free` tinyint(1) NULL DEFAULT 1 COMMENT '是否免费:0-付费,1-免费',
  `create_time` datetime NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `update_time` datetime NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 13 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci COMMENT = 'PPT生成工具表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of ppt_tool
-- ----------------------------
INSERT INTO `ppt_tool` VALUES (1, '/files/20250401/f3b0e84a0c7e43a69489df3b896ae22e.png', 'Kimi Plus', '个性化生成各种风格，无论简约还是小清新,总有一款适合你,Kimi懂PPT,更懂你! 立即体验Kimi AI生成PPT！', 'https://kimi.moonshot.cn/kimiplus/conpg18t7lagbbsfqksg', 1, '2025-04-01 10:42:14', '2025-04-01 10:42:14');
INSERT INTO `ppt_tool` VALUES (2, '/files/20250404/4a07731316464e71a6c627e991bdf299.png', 'Aippt', '高级AIPPT生成工具,免费10秒钟高效完成你所需PPT排版. 简单输入标题即可10秒钟生成所需PPT,样式精美', 'https://www.aippt.cn/', 1, '2025-04-04 11:53:44', '2025-04-04 11:53:44');
INSERT INTO `ppt_tool` VALUES (3, '/files/20250404/ace86ea32f85449ba930f7c5837ec994.jpg', 'iSlide-ppt生成工具', '10秒完成PPT,超50万PPT模板/素材,强大的设计排版功能,原创设计/正版保障/商用无忧,快速实现一键优化,轻松打造精美PPT,立即免费使用', 'https://www.islide.cc/', 1, '2025-04-04 11:56:43', '2025-04-04 11:56:43');
INSERT INTO `ppt_tool` VALUES (4, '/files/20250404/1003076ab0df4424afd1b66e49c08521.png', 'ChatBA', 'ChatBA是一个强大的人工智能驱动的AI生成PPT工具，用于自动生成幻灯片。 该工具使用OpenAI的API，根据用户提供的提示或主题快速生成幻灯片。', 'https://www.chatba.com/', 1, '2025-04-04 11:59:17', '2025-04-04 11:59:17');
INSERT INTO `ppt_tool` VALUES (5, '/files/20250404/aef85d6bef8143b7887022c251e85e79.png', '秒出PPT', 'AI一键生成ppt,全新AI技术,高效快速生成各种需求PPT模板,免费下载. 海量精美原创模板. ', 'https://10sppt.com/pptx/', 1, '2025-04-04 13:23:11', '2025-04-04 13:23:11');
INSERT INTO `ppt_tool` VALUES (6, '/files/20250404/21d2f46b084a40fea11368509f992f73.png', 'Gaippt', 'Gaippt是下一代PPT美化神器，基于AI智能辅助，可根据内容生成带有高度结构化可视化的PPT版式，并提供丰富的快捷操作，让PPT设计制作更简单。 ', 'https://www.gaippt.com/', 1, '2025-04-04 13:25:10', '2025-04-04 13:25:10');
INSERT INTO `ppt_tool` VALUES (7, '/files/20250404/7e839309157e431dabda5d7e2ec1ef58.png', 'VisDoc.cn', 'VisDoc.cn，通过自然语言生成专业图表和流程图，助力高效展示创意与思维。无需设计经验，1秒生成所需图表，让您的工作更智能、更便捷！', 'https://www.visdoc.cn/', 1, '2025-04-04 13:26:32', '2025-04-04 13:26:32');
INSERT INTO `ppt_tool` VALUES (8, '/files/20250404/4ec1df070f744fb6b34d7d44b3f91c17.png', '讯飞智文', '讯飞智文，由科大讯飞推出的一键生成ppt/word产品。 根据一句话、长文本、音视频等指令智能生成文档，同时支持在线编辑、美化、排版、导出等', 'https://zhiwen.xfyun.cn/', 1, '2025-04-04 13:28:44', '2025-04-04 13:28:44');
INSERT INTO `ppt_tool` VALUES (9, '/files/20250404/46d8af1745384a35b21c0735fad4a4a5.png', 'ChatPPT', 'ChatPPT为必优科技旗下国内AI生成PPT的办公产品，基于AI Chat指令式内容生成与创作，辅助职场办公人工更高效去创作PPT文档。', 'https://chat-ppt.com/', 1, '2025-04-04 13:31:05', '2025-04-04 13:31:05');
INSERT INTO `ppt_tool` VALUES (10, '/files/20250404/1930470611a440ca935bf9e3f5dc80c0.png', '轻竹办公', '轻竹办公一键生成PPT,AI一键制作ppt,智能AI工具,在线编辑,免费生成使用! 简单输入文字AI即可30秒内生成精美PPT,高效解决PPT需求!', 'https://qzoffice.com/', 1, '2025-04-04 13:33:21', '2025-04-04 13:33:21');
INSERT INTO `ppt_tool` VALUES (11, '/files/20250404/307d9fc28c9d454491cbc995c27cb942.png', '咔片PPT', '咔片内嵌专业级高清设计素材库，资源持续更新；PPT中的图片、插图、图标智能生成匹配，一键原位替换；矢量文件格式支持任意大小拖拽、填充色彩。', 'https://www.cappt.cc/', 1, '2025-04-04 13:37:34', '2025-04-04 13:37:34');
INSERT INTO `ppt_tool` VALUES (12, '/files/20250405/6b2940b62054455488da6d1a39139d91.jpg', '文多多AiPPT', '文多多AiPPT，一键搞定PPT。 AI根据主题、文档、网址智能生成PPT文档，同时支持在线编辑、美化、排版、导出、一键动效、自动生成演讲稿等功能，告别工作烦恼！', 'https://www.docmee.cn/', 1, '2025-04-05 12:41:27', '2025-04-05 12:41:27');

-- ----------------------------
-- Table structure for reading_summary
-- ----------------------------
DROP TABLE IF EXISTS `reading_summary`;
CREATE TABLE `reading_summary`  (
  `id` int NOT NULL AUTO_INCREMENT,
  `icon` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '图标URL',
  `name` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '网站名称',
  `description` text CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL COMMENT '网站描述',
  `url` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '网站链接',
  `is_free` tinyint(1) NULL DEFAULT 1 COMMENT '是否免费:0-付费,1-免费',
  `create_time` datetime NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `update_time` datetime NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 8 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci COMMENT = '阅读总结工具表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of reading_summary
-- ----------------------------
INSERT INTO `reading_summary` VALUES (1, '/files/20250407/9767764ca904450fbbd9318733397c2d.png', 'Kimi Copilot', 'Kimi Copilot – 是一款基于Kimi AI 的网页总结助手浏览器插件，安装在你的edge浏览器或者Chrome浏览器上，一键即可帮你总结当前网页内容。', 'https://kimi.tools/', 1, '2025-04-07 16:50:20', '2025-04-07 16:50:20');
INSERT INTO `reading_summary` VALUES (2, '/files/20250407/f6b72521f9a042dfa0789c607519f3da.png', 'ChatDOC', 'ChatDOC是一款可以快速解析、定位和总结上传的pdf文件内容的AI文档阅读工具，可以以聊天的形式对文档内容进行提问，并给出答案。', 'https://chatdoc.com/', 1, '2025-04-07 16:53:41', '2025-04-07 16:53:41');
INSERT INTO `reading_summary` VALUES (3, '/files/20250407/79a058ed6e934488a4a50ae022d681a0.png', 'ChatPDF', '免费的AI聊天与PDF、文档和演示文稿。即时阅读、分析、总结和翻译 50+ 种语言的 PDF。由ChatGPT和Claude提供动力。', 'https://www.chatpdf.com/zh', 1, '2025-04-07 17:00:09', '2025-04-07 17:00:09');
INSERT INTO `reading_summary` VALUES (4, '/files/20250407/30d70e88c8f94836aab95277f6b4e2a0.jpg', 'TXYZ', 'txyz（txyz.ai）是一个AI驱动的文献阅读和学术研究辅助平台，旨在提高研究人员和专业人士获取、理解和管理学术资料的效率。', 'https://www.txyz.ai/', 1, '2025-04-07 17:06:04', '2025-04-07 17:06:04');
INSERT INTO `reading_summary` VALUES (5, '/files/20250407/6239a9c7e05242bebeaf57f574e2df70.png', 'Elmo Chat', 'Elmo 允许您立即将网站内容浓缩成简洁的摘要。此功能迎合了快速读者和那些寻求掌握主要思想而不深入研究详细内容的人', 'https://www.elmo.chat/', 1, '2025-04-07 17:10:00', '2025-04-07 17:10:00');
INSERT INTO `reading_summary` VALUES (6, '/files/20250407/fe1d8a33cbb24db59e9c52d954f3447a.png', 'ima.copilot', 'ima.copilot是一款以知识库为核心的智能工作台产品，已接入腾讯混元大模型和DeepSeek R1模型。ima可以帮助用户快速获取、阅读、写作优质内容，提升学习、办公效率。', 'https://ima.qq.com/', 1, '2025-04-07 17:13:39', '2025-04-07 17:13:39');
INSERT INTO `reading_summary` VALUES (7, '/files/20250407/834f983eac0a44008c9e8aa9eeab1b43.jpg', 'Google NotebookLM', 'NotebookLM 利用 AI 的强大功能进行快速总结和记笔记，是您强大的虚拟研究助手，植根于您可以信赖的信息。', 'https://notebooklm.google/', 1, '2025-04-07 17:15:53', '2025-04-07 17:15:53');

-- ----------------------------
-- Table structure for resource_navigation
-- ----------------------------
DROP TABLE IF EXISTS `resource_navigation`;
CREATE TABLE `resource_navigation`  (
  `id` int NOT NULL AUTO_INCREMENT,
  `icon` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '图标URL',
  `name` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '资源名称',
  `description` text CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL COMMENT '资源描述',
  `url` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '资源链接',
  `category` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '资源分类',
  `create_time` datetime NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `update_time` datetime NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 16 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci COMMENT = '资源导航工具表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of resource_navigation
-- ----------------------------
INSERT INTO `resource_navigation` VALUES (1, '/files/20250401/88d3e8e6477b4b9cbd8961024a51edf1.png', '爱AI导航', '该导航收录了AI绘画、AI对话聊天、AI视频制作、AI音乐生成、AI图片处理、AI音频处理、AI办公软件、AI辅助编程、AI开放平台、AI资讯、AI算力平台等。', 'https://www.iai88.com/', 'AI集成工具', '2025-04-01 20:02:52', '2025-04-01 20:02:52');
INSERT INTO `resource_navigation` VALUES (8, '/files/20250401/280a7eeea1b340fc923835e2cd028cb0.png', '效率集', '可以通过这个网站导航到许多学术资源网站，适合小白。', 'https://www.xiaolvji.com/u/leviathan', '学术资源导航工具', '2025-04-01 20:11:20', '2025-04-01 20:11:20');
INSERT INTO `resource_navigation` VALUES (9, '/files/20250401/f1342d247e6f4b39b30265068d0ec885.png', '图钉AI导航', '免费AI生成语音、图片、视频、AI对话、模型训练等等！让你与各种类型的 AI 进行创作的社交平台。', 'https://www.tudingai.com/', 'AI集成导航工具', '2025-04-01 20:14:13', '2025-04-01 20:14:13');
INSERT INTO `resource_navigation` VALUES (10, '/files/20250401/e9a210cf7ba94fd2b3a94c706548111f.png', 'AI工具集', 'AI工具集官网收录了国内外数百个AI工具，该导航网站包括AI写作工具、AI图像生成和背景移除、AI视频制作、AI音频转录、AI辅助编程、AI音乐生成、AI绘画设计、AI对话聊天等AI工具集合大全。', 'https://ai-bot.cn/', 'AI集成工具集', '2025-04-01 20:15:02', '2025-04-01 20:15:02');
INSERT INTO `resource_navigation` VALUES (11, '/files/20250401/85a7af878c9e402aab453b27288e1fb7.png', 'AI导航网', 'AI导航网，收录了国内外1000+AI工具，该导航收录了AI绘画、AI对话聊天、AI视频制作、AI音乐生成、AI图片处理、AI音频处理、AI办公软件等。', 'https://www.ainav.cn/', 'AI导航工具', '2025-04-01 20:16:55', '2025-04-01 20:16:55');
INSERT INTO `resource_navigation` VALUES (12, '/files/20250401/9564f3ecf9d94a6e934701afa302f153.png', '发现AI', '发现AI官网，专业AI网站导航，一站式AI导航。 收录全球精品AI，包括办公AI、设计AI、编程AI、对话AI、等等优质AI工具。', 'https://www.faxianai.com/', 'AI导航工具', '2025-04-01 20:18:43', '2025-04-01 20:18:43');
INSERT INTO `resource_navigation` VALUES (13, '/files/20250401/2489d71d15ed48c892e6c01f362052ed.png', 'AI在线', '一个免费的AI工具箱：AI 照片转绘图、AI 新媒体文案、AI 插画素材生成、AI 扩图补全画面、AI 消除画面多余背景 唐库学习 豆包MarsCode。', 'https://nav.iaiol.com/', 'AI导航工具集', '2025-04-01 20:21:00', '2025-04-01 20:21:00');
INSERT INTO `resource_navigation` VALUES (14, '/files/20250401/ce90ec2e9fee49fb91ab2236446c9b35.png', '在线工具', '提供丰富的在线工具。', 'https://tool.lu/', '在线工具集', '2025-04-01 20:53:27', '2025-04-01 20:53:27');
INSERT INTO `resource_navigation` VALUES (15, '/files/20250401/72738887b2d64b99b9ba65fd69588d97.png', '68在线工具', '在线代码高亮、代码着色工具，支持自动识别语言。 在线源码查看器，输入网址即可查看源码。', 'https://www.68tools.com/', '工科工具集', '2025-04-01 21:18:44', '2025-04-01 21:18:44');

-- ----------------------------
-- Table structure for resume_template
-- ----------------------------
DROP TABLE IF EXISTS `resume_template`;
CREATE TABLE `resume_template`  (
  `id` int NOT NULL AUTO_INCREMENT,
  `icon` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '图标URL',
  `name` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '网站名称',
  `description` text CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL COMMENT '网站描述',
  `url` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '网站链接',
  `is_free` tinyint(1) NULL DEFAULT 1 COMMENT '是否免费:0-付费,1-免费',
  `create_time` datetime NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `update_time` datetime NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 9 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci COMMENT = '简历模板网站表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of resume_template
-- ----------------------------
INSERT INTO `resume_template` VALUES (1, '/files/20250406/3642c6008eec45798119189022065c4e.png', '简历设计网', '2000+Word模板免费下载，每个用户每天可下载10篇免费模板。', 'https://www.jianlisheji.com/', 1, '2025-04-06 17:37:26', '2025-04-06 17:37:26');
INSERT INTO `resume_template` VALUES (2, '/files/20250406/3ab51562ab5f43bb9f8c91684c1a889b.png', '办公资源网', '提供各种精美创意PPT模板、Excel模板、Word模板、免费音效资源及大量办公素材，包括个人简历Word模板。', 'https://www.bangongziyuan.com/', 1, '2025-04-06 17:39:29', '2025-04-06 17:39:29');
INSERT INTO `resume_template` VALUES (3, '/files/20250406/3e3a51890af3449fa594c8e9ab94170a.jpg', 'Canva', '提供了海量的免费设计模板,涵盖海报、简历、名片、Logo、宣传单、PPT、手抄报、二维码、Banner等数十种平面设计场景', 'https://www.canva.cn/', 1, '2025-04-06 17:41:06', '2025-04-06 17:41:06');
INSERT INTO `resume_template` VALUES (4, '/files/20250406/5f8ef29aa1db432487390d39a844f64a.jpg', '创客贴', '创客贴是一款极简的在线平面设计工具，用户使用平台提供的海量素材、模板，通过简单拖拉拽操作就可以轻松设计出精美的海报、ppt、信息图、微信公众号图片等设计。', 'https://www.chuangkit.com/', 1, '2025-04-06 17:43:00', '2025-04-06 17:43:00');
INSERT INTO `resume_template` VALUES (5, '/files/20250407/34b1572378a14372bc6c9bf0a72381cd.png', '锤子简历', '锤子简历是一个智能简历制作工具，提供百万人才都在用的精美简历模板，支持在线编辑、Word下载、PPT导出等功能。', 'https://www.100chui.com/', 1, '2025-04-07 16:35:37', '2025-04-07 16:35:37');
INSERT INTO `resume_template` VALUES (6, '/files/20250407/40ebc566a49d4890b1cce78f429d2d3d.png', '简历模板资源网', '简历模板资源网提供各种风格和行业的中文简历模板，可免费下载和编辑，适合应届毕业生、求职者和职场人士。浏览网站，找到适合你的简历模板，一键下载，轻松制作个性化的求职简历。', 'https://www.jianlimoban-ziyuan.com/zhongwen/', 1, '2025-04-07 16:39:53', '2025-04-07 16:39:53');
INSERT INTO `resume_template` VALUES (7, '/files/20250407/1edfd6c397f142fd9a5d8a05eac0d5ae.png', '简历下载网', '简历下载网免费提供各行业简历模板WORD可编辑格式下载，涵盖求职简历模板、大学生简历模板、个人简历模板、英文简历模板、免费简历模板、工作简历模板、保研简历模板、暑期实习简历、寒假实习简历、校招简历等。', 'https://jianlixiazai.cn/', 1, '2025-04-07 16:43:37', '2025-04-07 16:43:37');
INSERT INTO `resume_template` VALUES (8, '/files/20250407/b590eefb28c9420bbd6a7b7e238e322b.png', '模板简历网站', '模板简历网站提供个人简历电子版免费下载，可编辑word格式个人简历模板，简历表格，单页简历，多页简历模板，简历封面模板，英文简历模板，空白简历模板，高端大气简历等。为你求职找工作必备简历。', 'https://www.mubanjianli.com/', 1, '2025-04-07 16:47:53', '2025-04-07 16:47:53');

-- ----------------------------
-- Table structure for sys_user
-- ----------------------------
DROP TABLE IF EXISTS `sys_user`;
CREATE TABLE `sys_user`  (
  `id` int NOT NULL AUTO_INCREMENT COMMENT '主键ID',
  `name` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '用户名',
  `password` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '密码',
  `email` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '邮箱',
  `phone` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '手机号',
  `role` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '普通用户' COMMENT '角色',
  `date` datetime NULL DEFAULT CURRENT_TIMESTAMP COMMENT '注册时间',
  `avatar` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '/default-avatar.png' COMMENT '头像',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `uk_name`(`name` ASC) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 3 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci COMMENT = '用户表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_user
-- ----------------------------
INSERT INTO `sys_user` VALUES (1, 'admin', 'admin123', 'admin@example.com', '13800138000', '管理员', '2025-03-25 20:19:58', '/default-avatar.png');
INSERT INTO `sys_user` VALUES (2, 'mizhuo', '123456', 'mixiongwudi123@gmail.com', '19817288645', '普通用户', '2025-03-25 20:43:47', '/default-avatar.png');

-- ----------------------------
-- Table structure for teacher_resource
-- ----------------------------
DROP TABLE IF EXISTS `teacher_resource`;
CREATE TABLE `teacher_resource`  (
  `id` int NOT NULL AUTO_INCREMENT,
  `icon` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '图标URL',
  `name` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '网站名称',
  `description` text CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL COMMENT '网站描述',
  `url` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '网站链接',
  `is_free` tinyint(1) NULL DEFAULT 1 COMMENT '是否免费:0-付费,1-免费',
  `create_time` datetime NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `update_time` datetime NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 15 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci COMMENT = '教师资源网站表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of teacher_resource
-- ----------------------------
INSERT INTO `teacher_resource` VALUES (1, '/files/20250401/3ce75a8baf3948df941b2be5c04be207.png', '办公资源', '这是一个PPT模板网站，包含了各行各业的PPT模板资源，其中就有从小学到高中的各科PPT课件，直接下载学习就行了。', 'https://www.bangongziyuan.com/', 1, '2025-04-01 15:23:59', '2025-04-01 15:23:59');
INSERT INTO `teacher_resource` VALUES (2, '/files/20250401/6256f2597a0a458a973c275eafaa5611.png', '第一课件网', '这个网站提供学习课件，包含语数外政史地理化生，9大学科课件免费下载，同时也有音美体等课件，非常丰富。', 'https://www.1kejian.cn/', 1, '2025-04-01 15:26:43', '2025-04-01 15:26:43');
INSERT INTO `teacher_resource` VALUES (3, '/files/20250401/2d6e30f7f88e4f61a30a75be61778975.png', '第二教育网', '第二教育网是一个专注基础教育，提供备课资源、小微课、组卷、学科素养等教学服务的网站。网站内容涵盖各学科各年级的课件、习题、教案、视频等，支持在线学习和下载。', 'https://www.dearedu.com/', 1, '2025-04-01 15:30:14', '2025-04-01 15:30:14');
INSERT INTO `teacher_resource` VALUES (4, '/files/20250401/451b0d3c5d414945ac39988425c3ee82.jpg', '学科网', '这是一个精品学科资源网站，小学、初中、高中各学段都有，学科版本齐全，同步教学，除了涵盖备课功能外，还可以组卷。', 'https://www.zxxk.com/', 0, '2025-04-01 15:32:32', '2025-04-01 15:48:48');
INSERT INTO `teacher_resource` VALUES (5, '/files/20250401/0d0468a9b3ed486bb655954d5ae25bb3.png', '菁优网', '菁优网拥有2500万原创全解全析题库,涵盖全学科学段,提供各省市中小学各版本教材的试题试卷下载,多种方式组卷,还有校本题库、测评、精品资源、在线作业、伴印等产品', 'https://www.jyeoo.com/', 1, '2025-04-01 15:34:20', '2025-04-01 15:34:20');
INSERT INTO `teacher_resource` VALUES (6, '/files/20250401/f51eeea8fbeb48719f550be5f0b54c1d.png', '贝壳网', '贝壳网提供优课大师、在线教研、智能测评云等多种产品和服务，支持中小学教师备课、教研、评价和管理。网站还有丰富的教学资源、名师课堂、教师活动等内容', 'https://www.bakclass.com/', 1, '2025-04-01 15:40:19', '2025-04-01 15:40:19');
INSERT INTO `teacher_resource` VALUES (7, '/files/20250401/1ea160ef51c84ab59a1d30c82ebc91aa.png', '教习网', '教习网精选小学、初中、高中、中职语文、数学、英语、道德与法治、科学、物理、化学、生物、历史、地理、政治等学科课堂教学所需的PPT课件、教案教学设计、试题试卷等资源下载，涵盖部编版、人教版、北师大版等主流版本。', 'https://www.51jiaoxi.com/', 1, '2025-04-01 15:42:47', '2025-04-01 15:42:47');
INSERT INTO `teacher_resource` VALUES (8, '/files/20250401/6af9da9f47574f74b8750c4b853e18a5.jpg', '人民教育出版社', '人民教育出版社官网提供中小学教材电子版，包括义务教育、高中、盲校、聋校、培智学校等各类学段和学科的学生用书。用户可以在线阅读或下载电子版，方便学习和参考。', 'https://www.pep.com.cn/products/', 1, '2025-04-01 15:45:58', '2025-04-01 15:45:58');
INSERT INTO `teacher_resource` VALUES (9, '/files/20250401/c71f7b9a39a44ef7accfafc4c2a5659e.png', '21世纪教育网', '21世纪教育网（二一教育）提供小学、初中、高中各科目的试题、课件、教案、学案等教学资源，支持会员下载和上传，还有名师导航、课堂无忧、素养提升等服务。', 'https://www.21cnjy.com/', 0, '2025-04-01 15:48:22', '2025-04-01 15:48:40');
INSERT INTO `teacher_resource` VALUES (10, '/files/20250401/257d9db252524ba5a35ec1e0ca2f3073.png', '组卷网', '组卷网是一个提供初高中数学、语文、英语等科目的题库和试卷的在线平台，支持智能选题、同步教学、高考备考等功能。', 'https://zujuan.xkw.com/', 0, '2025-04-01 15:50:53', '2025-04-01 15:51:02');
INSERT INTO `teacher_resource` VALUES (11, '/files/20250401/4abdb3f2ba8447559baa5d373867df04.png', '中国大学MOCC(慕课)', '中国大学MOOC (慕课) 是爱课程网携手网易云课堂打造的在线学习平台，每一个有提升愿望的人，都可以在这里学习中国优质的大学课程，学完还能获得认证证书。', 'https://www.icourse163.org/', 1, '2025-04-01 15:53:30', '2025-04-01 15:53:30');
INSERT INTO `teacher_resource` VALUES (12, '/files/20250401/9d5f205d9f1a4b87bbc86e88e345a558.png', '电子课本网', '电子课本网提供人教版、苏教版、北师大版等多种版本的电子课本，涵盖小学、初中、高中的各科目，方便学生和教师在线阅读。', 'http://www.dzkbw.com/', 1, '2025-04-01 15:56:24', '2025-04-01 15:56:24');
INSERT INTO `teacher_resource` VALUES (13, '/files/20250401/04d6d267de5a405d842d38b05aad5490.png', '课本库网', '电子课本库网提供最新最全的小学课本、初中课本、高中课本导航，包含语文、数学、英语、物理、化学、政治、历史、生物及地理等各版本电子教材。', 'http://www.kebenku.com/', 1, '2025-04-01 15:58:51', '2025-04-01 15:58:51');
INSERT INTO `teacher_resource` VALUES (14, '/files/20250401/407cce94795a48148e27d8559b11edee.png', '状元网', '状元网-海量中小学教育资源共享平台、权威教学资源门户网站！ 状元网发布中考数学压轴题微课堂系列专... 人教版七年级下册语文同步测试，同步复... ', 'http://www.zhuangyuan123.com/', 1, '2025-04-01 16:04:38', '2025-04-01 16:04:38');

-- ----------------------------
-- Table structure for translation_tool
-- ----------------------------
DROP TABLE IF EXISTS `translation_tool`;
CREATE TABLE `translation_tool`  (
  `id` int NOT NULL AUTO_INCREMENT,
  `icon` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '图标URL',
  `name` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '网站名称',
  `description` text CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL COMMENT '网站描述',
  `url` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '网站链接',
  `is_free` tinyint(1) NULL DEFAULT 1 COMMENT '是否免费:0-付费,1-免费',
  `create_time` datetime NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `update_time` datetime NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 5 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci COMMENT = '在线翻译工具表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of translation_tool
-- ----------------------------
INSERT INTO `translation_tool` VALUES (1, '/files/20250331/7ea44d0e38e94e77b67b59edd9dc9a15.jpg', 'DeepL翻译', 'DeepL 翻译器 安全、高效、准确地翻译 DeepL Write 提高写作水平，适应受众需求 DeepL Voice 实时多语言交流 DeepL API 新 为受众提供多语言产品 DeepL 集成。', 'https://www.deepl.com/zh/translator/', 1, '2025-03-31 21:37:25', '2025-03-31 21:37:25');
INSERT INTO `translation_tool` VALUES (2, '/files/20250403/355919766a454bfab9632c8a8717638e.png', '有道翻译', '网易自营 人工翻译服务，专业、精准、地道！ 精选全球上万名译员实时待命，专家审校，母语润色。 严格质量把控，多重售后保障，让您翻译无忧！', 'https://fanyi.youdao.com/#/AITranslate', 1, '2025-04-03 21:05:24', '2025-04-03 21:05:24');
INSERT INTO `translation_tool` VALUES (3, '/files/20250403/d8cfe984d9d44e9e9a31b57bbaad046f.png', '百度翻译', '百度翻译打造的新一代AI大模型翻译平台，为用户提供翻译和阅读外文场景的一站式智能解决方案，支持中文、英文、日语、韩语、德语、法语等203种语言，包括文档翻译、AI翻译、英文润色、双语审校、语法分析等多种能力。', 'https://fanyi.baidu.com/', 1, '2025-04-03 21:10:30', '2025-04-03 21:10:30');
INSERT INTO `translation_tool` VALUES (4, '/files/20250403/53828f50f69c4cae89d6aa567c53616c.png', '智能翻译官', '在线文本翻译器即时提供简体中文、繁体中文、英文、阿拉伯语、德语、法语、葡萄牙语、西班牙语、意大利语、韩语的互译服务，支持在办公、旅游、交流等场景中使用。', 'https://www.fanyi1234.com/lang/', 1, '2025-04-03 21:12:00', '2025-04-03 21:12:00');

SET FOREIGN_KEY_CHECKS = 1;
