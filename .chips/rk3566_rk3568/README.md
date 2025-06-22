# 基于 RK3566-RK3568 平台的固件构建配置目录


## 📁 文件结构解析

```
├── boot4recovery.its
├── boot.its
```

### `boot*.its` - **U-Boot FIT image 配置文件**

* `.its` = **Image Tree Source**，用于生成 U-Boot 支持的 FIT 镜像（Flattened Image Tree），定义了内核、设备树、ramdisk 的加载地址、顺序和签名信息。
* `boot.its`: 正常启动的系统用。
* `boot4recovery.its`: 用于 **recovery 模式**（恢复出厂、刷机、系统修复）启动镜像。

---

```
├── darkos_rk3568_buildroot_lvgl_defconfig
├── darkos_rk3568_buildroot_qt_defconfig
├── darkos_rk3568_debian_lite_defconfig
├── darkos_rk3568_debian_xfce_defconfig
├── darkos_rk3568_ubuntu_lite_defconfig
├── darkos_rk3568_ubuntu_xfce_defconfig
```

### `*_defconfig` - **系统构建配置文件**

这些是不同发行版的构建配置项，一般用于 Buildroot 或 Debian/Ubuntu 的裁剪构建工具。每个文件对应一种系统镜像。

| 文件名                                      | 描述                                      |
| ---------------------------------------- | --------------------------------------- |
| `darkos_rk3568_buildroot_lvgl_defconfig` | 使用 Buildroot 构建，GUI 使用 **LVGL**（轻量级图形库） |
| `darkos_rk3568_buildroot_qt_defconfig`   | 使用 Buildroot 构建，图形界面用 **Qt**            |
| `darkos_rk3568_debian_lite_defconfig`    | 精简版 Debian 系统构建配置                       |
| `darkos_rk3568_debian_xfce_defconfig`    | 带有 XFCE 桌面环境的 Debian                    |
| `darkos_rk3568_ubuntu_lite_defconfig`    | 精简版 Ubuntu 系统构建配置                       |
| `darkos_rk3568_ubuntu_xfce_defconfig`    | 带有 XFCE 桌面环境的 Ubuntu                    |

> **用途**：你可以用这些配置作为构建参数输入给 Buildroot 或 debootstrap 脚本，用于构建定制系统根文件系统。

---

```
├── parameter-buildroot-fit-ab.txt
├── parameter-buildroot-fit.txt
├── parameter-buildroot-spi-nor-64M.txt
├── parameter-exboot.txt
```

### `parameter-*.txt` - **固件分区表参数文件**

这些是针对不同系统构建场景、启动方式或存储介质定制的 parameter 文件。

| 文件名                                   | 描述                              |
| ------------------------------------- | ------------------------------- |
| `parameter-buildroot-fit.txt`         | 标准的 Buildroot + FIT 镜像分区表       |
| `parameter-buildroot-fit-ab.txt`      | 双系统（A/B 分区）升级机制支持的分区表           |
| `parameter-buildroot-spi-nor-64M.txt` | 适配 **64MB SPI NOR Flash** 的分区布局 |
| `parameter-exboot.txt`                | “外部启动”场景配置，例如使用 U盘/SD 卡等外部设备引导  |

---

