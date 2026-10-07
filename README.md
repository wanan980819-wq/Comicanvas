# Comicanvas

一个**开箱即用**的 ComfyUI 运行环境镜像。

不用自己装环境、装插件、找工作流 —— 开实例即可开始出图。

---

## 一、镜像里有什么

| 内容 | 说明 |
| --- | --- |
| **ComfyUI v0.36.0** | 主程序位于 `/root/ComfyUI` |
| **Python 3.10.8** | 独立虚拟环境 `/root/ComfyUI/venv`（系统全局环境未安装依赖） |
| **180 个 ComfyUI 插件** | 位于 `/root/ComfyUI/custom_nodes`，含 **ComfyUI-Manager**（可在线安装 / 管理插件） |
| **294 条工作流** | 位于 `/root/ComfyUI/user/default/workflows`，已按用途分类 |

> 镜像内**不含模型文件**。模型建议使用 AutoDL 公共模型库（只读挂载点 `/.autodl-model/data`），
> 软链接到 ComfyUI 的 `models` 目录即可使用。

---

## 二、怎么启动

在实例终端执行（镜像里已预置）：

```bash
bash /root/Comicanvas/start.sh
```

或者在本仓库目录下：

```bash
bash start.sh
```

也可以手动启动：

```bash
cd /root/ComfyUI
venv/bin/python main.py --listen 0.0.0.0 --port 6006
```

启动完成后，在 AutoDL 实例页面点击 **「自定义服务 / WebUI-6006」** 打开 ComfyUI 界面。

> AutoDL 会为每个实例把 **6006 / 6008** 端口映射到可公网访问的地址，详见官方文档：
> <https://www.autodl.com/docs/port/>

---

## 三、目录说明

```text
/root/ComfyUI/
├── main.py                  入口
├── venv/                    Python 虚拟环境（请用这里的 python）
├── custom_nodes/            插件（180 个）
├── models/                  模型目录（镜像内为空，建议软链公共模型库）
└── user/default/workflows/  工作流（294 条）
```

---

## 四、几点提示

1. **首次启动较慢**：插件数量多，加载需要 1～2 分钟，属正常现象。
2. **务必使用 venv 里的 python**：`/root/ComfyUI/venv/bin/python`。
   系统自带的 `python` 命令里没有 ComfyUI 的依赖。
3. **显存**：建议 12GB 及以上显存，具体取决于所运行的工作流。
4. **插件来源**：`custom_nodes` 下的插件均取自 GitHub 公开仓库，可用 ComfyUI-Manager 直接更新。
