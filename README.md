# Easy Teleoperate Node

EasyTeleop-Node 是 EasyTeleop 分布式遥操作系统的节点组件，负责直接控制硬件设备并与后端服务通信。

## 功能特性

- 设备控制：直接控制机械臂、VR设备和摄像头等硬件
- WebSocket通信：通过WebSocket与后端服务进行实时通信
- MQTT状态同步：使用MQTT协议同步设备状态
- WebRTC支持：支持低延迟视频流传输
- 可扩展架构：支持多实例部署，每个节点可管理一组设备

## 系统架构

本系统采用分布式架构，作为节点组件负责设备控制：

### Node (设备控制节点)
- 使用Python开发
- 负责直接控制硬件设备（机械臂、VR、摄像头等）
- 通过WebSocket与Backend通信
- 支持多实例部署，每个Node可管理一组设备

### Backend (后端服务)
位于 [server](/server) 目录中：
- 使用Python和FastAPI框架开发
- 提供Web管理界面（位于 [server/static](/server/static)）
- 管理多个Node节点的注册和通信
- 提供RESTful API接口

两者通过WebSocket RPC协议进行通信，实现设备控制与Web管理的分离。

## 项目结构

```
EasyTeleop-Node/
├── node.py                 # 节点主程序
├── WebSocketRPC.py         # WebSocket RPC实现
├── pyproject.toml          # 项目配置和依赖
├── server/                 # 后端服务
│   ├── backend.py          # 后端主程序
│   ├── MQTTStatusSync.py   # MQTT状态同步模块
│   ├── run_mqtt_sync.py    # MQTT同步启动脚本
│   └── static/             # Web静态资源
│       ├── index.html      # 主页
│       ├── style.css       # 样式表
│       └── js/             # JavaScript代码
│           ├── main.js     # 主JS文件
│           └── components/ # 组件JS文件
│               ├── Dashboard.js
│               ├── DeviceManager.js
│               ├── Navigation.js
│               └── TeleopManager.js
└── README.md
```

## 安装指南

### 环境要求
- Python 3.7+
- 支持的系统：Windows/Linux/macOS

### 安装依赖

```bash
# 安装项目依赖
uv sync
```

## 使用方法

### 启动服务

1. 启动后端服务:
```bash
# 在项目根目录下
python server/backend.py
```

2. 启动节点:
```bash
python node.py
```

访问 http://localhost:8000 查看Web界面

### Web界面功能
1. **设备管理**：
   - 查看所有设备状态
   - 添加/删除设备
   - 配置设备参数
   - 启动/停止设备

2. **遥操作组管理**：
   - 创建遥操作组
   - 配置组内设备（左右机械臂、VR头显、摄像头）
   - 启动/停止遥操作

### API接口
系统提供RESTful API接口，可通过 `/api` 路径访问各种功能。