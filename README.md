# Easy Teleoperate Node

EasyTeleop-Node 是基于[EasyTeleop工具包](https://github.com/SZUEAILab/EasyTeleop)的分布式遥操作系统的节点组件，负责直接控制硬件设备并与后端服务通信。

## 功能特性

- 设备控制：直接控制机械臂、VR设备和摄像头等硬件
- WebSocket通信：通过WebSocket与后端服务进行实时通信
- MQTT状态同步：使用MQTT协议同步设备状态
- WebRTC支持：支持低延迟视频流传输
- 可扩展架构：支持多实例部署，每个节点可管理一组设备

## 项目结构

```
EasyTeleop-Node/
├── node.py                 # 节点主程序
├── WebSocketRPC.py         # WebSocket RPC实现
├── pyproject.toml          # 项目配置和依赖
└── README.md
```

## 安装指南

### 环境要求
- Python 3.7+
- 支持的系统：Windows/Linux/macOS

### 安装依赖

```bash
# 安装uv
pip install uv
# 安装项目依赖
uv sync
```

## 使用方法

### 启动节点
```bash
uv run node.py
```

## 依赖的外部服务

本项目需要以下外部服务配合使用:
1. MQTT Broker (如Mosquitto) - 用于状态同步
2. Backend服务 - 提供Web管理界面
