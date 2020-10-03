# 订单管理系统
![GitHub contributors](https://img.shields.io/github/contributors/ac-fan/order-manger-system?style=for-the-badge)
![GitHub stars](https://img.shields.io/github/stars/ac-fan/order-manger-system?color=ffd700&style=for-the-badge)
![GitHub forks](https://img.shields.io/github/forks/ac-fan/order-manger-system?color=60c5ba&style=for-the-badge)
![GitHub issues](https://img.shields.io/github/issues/ac-fan/order-manger-system?color=1E90FF&style=for-the-badge)
![GitHub](https://img.shields.io/github/license/ac-fan/order-manger-system?style=for-the-badge)
---
## 主要功能
* 供应商管理
* 订单管理
* 用户端丽
```
//TODO
```

---
## 开发环境
- IDE : `JetBrains™ IntelliJ IDEA 2020.2.1`
- 数据库 : `Oracle™ Mysql 8.0.13`
- JDK版本 : `Oracle™ Java JDK 1.8`
- Tomcat版本 : `Apache™ Tomcat 8.x`

## 项目整体架构
```
├─ database                          // 数据库相关文件
│  ├─ design				            // 数据库设计
│  │  └─1
│  └─ sql                            // 数据库初始化脚本文件
├─ src                               // 项目源代码目录
│  └─ com                            //源代码目录
│  │  └─ qst                            // java代码目录
│  │  │  ├─ controller                      // 控制层
│  │  │  ├─ dao                             // 持久层
│  │  │  ├─ entity                          // 实体类
│  │  │  ├─ filter                          // 过滤器
│  │  │  ├─ lisener                         // 监听器
│  │  │  ├─ ***                             // ***
│  │  │  ├─ service                         // 服务层
│  │  │  │  └─ impl                             // 服务层接口实现
│  │  │  └─ util                            // 工具类
├─ test                                 // 测试代码目录
├─ web                               // tomcat前端文件目录
│  ├─ WEB-INF                           // 页面相关配置文件
│  ├─ static                            // 页面所需静态资源 
│  │  ├─ css                                // 页面所需 css
│  │  ├─ js                                 // 页面所需 js 
│  │  ├─ imgs                               // 页面所需图片 
│  │  └─ ***                                // 页面所需*** 
│  └─ jsp                               // jsp页面目录                            
├─ README.md                         // README
└─ LICENSE                           // 项目所使用的软件许可证
```

## 更新内容
```
//TODO
```

