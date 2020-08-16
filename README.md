# ProtocolServiceKit

[![CI Status](https://img.shields.io/travis/DevdragonLi/ProtocolServiceKit.svg?style=flat)](https://travis-ci.org/DevdragonLi/ProtocolServiceKit)
[![Version](https://img.shields.io/cocoapods/v/ProtocolServiceKit.svg?style=flat)](https://cocoapods.org/pods/ProtocolServiceKit)
[![License](https://img.shields.io/cocoapods/l/ProtocolServiceKit.svg?style=flat)](https://cocoapods.org/pods/ProtocolServiceKit)
[![Platform](https://img.shields.io/cocoapods/p/ProtocolServiceKit.svg?style=flat)](https://cocoapods.org/pods/ProtocolServiceKit)

> `东半球`最高效的 Protocol<=>Service 中间件，解决中间件的占用内存问题。

## 业界常用的组件通信方案

### URL Router

> 蘑菇街路线

- 优点：方案成熟，能解决组件依赖 
	- 可多端复用 ✅
- 缺点：需要注册维护URL表，传递类型单一，编译阶段无法发现潜在BUG  🙅‍♂️
	- 注册存在内存占用问题

### Target-Action

- 优点：不需要注册和内存占用 ✅

- 缺点：编译阶段无法发现潜在BUG，必须遵守命名规则 🙅‍♂️
	
### Protocol-Class

- 优点：接口与实现分离，编译阶段就能发现问题  ✅

- 缺点：需要注册和内存占用  
	- 此`repo` 简易组件已解决✅

### ProtocolServiceKit 

- 优点：同上`Protocol-Class` 方案，但移除了注册逻辑，解决占用内存问题。
-  缺点：需要遵从命名规范。（后续更新解决方案`doing`，参考最下方`计划`部分）
	- 此缺点可通过维护Plist表做映射关系处理（二次改造）。


## 建议项目引入搭配方案

- ProtocolServiceKit 负责组件中间件

- [ZDModuleKit](https://github.com/DevDragonLi/ZDModuleKit)：负责组件生命周期管理
	- 后续更新

## Example

To run the example project, clone the repo, and run `pod install` from the Example directory first.

- AccountBusiness <=> PlayBusiness 

```

  组件交互： VIP和播放业务复杂后，只公开Protocol文件决定业务对外能力

    Class <LFLVipProtocol> vipService = ServiceClassWithProtocol(LFLVipProtocol);
    if (vipService && [vipService isCurrentUserVipStatus]) {
        Class <LFLPlayProtocol> playService = ServiceClassWithProtocol(LFLPlayProtocol);
        [playService playMiniVideo];
        
    } else {
        NSLog(@"Error:LFLVipProtocol notfound service Class");
    }

```

- 对外业务能力如果未实现，运行期会触发断言处，便于发现问题。

- recommended convention

	- `XXX`Service

	- `XXX`Protocol


## Installation

ProtocolServiceKitis available through [CocoaPods: ProtocolServiceKit](https://cocoapods.org/pods/ProtocolServiceKit). To install
it, simply add the following line to your Podfile:

```ruby
deprecate
pod 'ProtocolServiceManger',"~>1.0.0"

// recommended
pod 'ProtocolServiceKit',"~>1.1.0"

```

## 计划

- 缓存项目最常用到组件Protocol 和Service 引入白名单 机制
	- 建议为10个以内，KIt内部维护一张表（均存String），用于直接返回ServiceClass
	- 此方案为可选方案。
		- 部分项目存在Service需要为单利场景，建议使用。
- 引入`map`机制，可以不按照约定规则来提供Service Class，项目初始化提供map表机制，解决**强制**命名类规范问题，可自由自定义。

## Author

DevdragonLi, dragonLi_52171@163.com

## License

ProtocolServiceKitis available under the MIT license. See the LICENSE file for more info.
