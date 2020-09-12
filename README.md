# ProtocolServiceKit

-  [业界常用的组件通信方案优缺点对比](#业界常用的组件通信方案)
    -  [URL Router](#url-router)
    -  [Target-Action](#target-action)
    -  [Protocol-Class](#protocol-class)

-  [ProtocolServiceKit](#protocolservicekit)

-  [Installation](#installation)

-  [OC Example](#OCExample)

-  [Swift Example](#swift示例)


[![CI
Status](https://img.shields.io/travis/DevdragonLi/ProtocolServiceKit.svg?style=flat)](https://travis-ci.org/DevdragonLi/ProtocolServiceKit)
[![Version](https://img.shields.io/cocoapods/v/ProtocolServiceKit.svg?style=flat)](https://cocoapods.org/pods/ProtocolServiceKit)
[![License](https://img.shields.io/cocoapods/l/ProtocolServiceKit.svg?style=flat)](https://cocoapods.org/pods/ProtocolServiceKit)
[![Platform](https://img.shields.io/cocoapods/p/ProtocolServiceKit.svg?style=flat)](https://cocoapods.org/pods/ProtocolServiceKit)

> `东半球`最高效的 Protocol<=>Service 中间件，解决中间件的占用内存问题。

> 支持不规则命名/缓存机制
>  OC/Swift项目均可使用此Kit

## 业界常用的组件通信方案

### URL Router

> 蘑菇街路线

-   优点：方案成熟，极高的动态性，能解决组件依赖 ，易于适配 URL Scheme
    -   可多端复用 （方便地统一管理多平台的路由规则） ✅
-   缺点：需要注册维护URL表，编译阶段无法发现潜在BUG 🙅‍♂️
    -   注册存在内存占用问题
    -   传参方式有限，并且**无法利用编译器进行参数类型检查**，因此所有的参数都只能从字符串中转换而来
        -   参数可以通过 protocol
            直接传递，能够利用编译器检查参数类型，并且在 ZIKRouter
            中，能通过路由声明和编译检查。
    -   要让 view controller 支持
        url，需要为其新增初始化方法，因此需要对模块做出修改
        -   不支持 storyboard
    -   无法明确声明模块提供的接口，只能依赖于接口文档，重构时无法确保修改正确
    -   无法保证所使用的模块一定存在
    -   解耦能力有限，url
        的"注册"、"实现"、"使用"必须用相同的字符规则，一旦任何一方做出修改都会导致其他方的代码失效，并且重构难度大

### Target-Action

-   优点：不需要注册和内存占用 ✅

-   缺点：编译阶段无法发现潜在BUG，必须遵守命名规则 🙅‍♂️

    -   在 category
        中仍然引入了字符串硬编码，内部使用字典传参，一定程度上也存在和
        URL 路由相同的问题
        -   字典传参的问题
    -   无法保证所使用的模块一定存在，target
        模块在修改后，使用者只有在运行时才能发现错误
    -   过于依赖 runtime 特性，无法应用到纯 Swift 上。在 Swift 中扩展
        mediator 时，无法使用纯 Swift 类型的参数
    -   可能会创建过多的 target 类
    -   使用 runtime
        相关的接口调用任意类的任意方法，需要注意别被苹果的审核误伤。

### Protocol-Class

-   优点：接口与实现分离，编译阶段就能发现问题 ✅

-   缺点：需要注册和内存占用

    -   由框架来创建所有对象，创建方式有限，例如不支持外部传入参数，再调用自定义初始化方法
    -   只做了 protocol 和 class
        的匹配，不支持更复杂的创建方式和依赖注入
    -   无法保证所使用的 protocol 一定存在对应的模块，也无法直接判断某个
        protocol 是否能用于获取模块
    -   此`repo` 简易组件已解决✅

## ProtocolServiceKit

-   优点：同上`Protocol-Class`
    方案，但移除了注册逻辑，解决占用内存问题。
-   缓存机制 ✅
    -   建议项目最常用到组件Protocol 和Service
        使用，Kit内部维护一张表，用于直接返回ServiceClass
    -   1.3.0 + Support
-   **Map**机制，可以不按照约定规则来提供ServiceClass，项目初始化/需要处提供map表机制，解决**强制**命名类规范问题，可自由自定义。
    ✅
    -   1.2.0 + Support
-   部分缺点同上`Protocol-Class`

## Installation

> ProtocolServiceKit is available through [CocoaPods:ProtocolServiceKit](https://cocoapods.org/pods/ProtocolServiceKit). To install it, simply add the following line to your Podfile:

``` ruby
// recommended
pod 'ProtocolServiceKit',"~>1.4.2"

deprecate
pod 'ProtocolServiceManger',"~>1.0.0"

```

## Example

> To run the example/SwiftExample project, clone the repo, and run `pod install` from the Example directory first.

####  Main API

```objc

- (Class)serviceClassWithProtocol:(Protocol *)aProtocol;

- (Class)serviceClassWithCachedProtocol:(Protocol *)cachedProtocol;

- (void)configProtocolServiceMapsWithDic:(NSDictionary < NSString * ,NSString *> *)mapDics;

```

-  AccountBusiness <=> PlayBusiness Example 

```objc

// VIP和播放业务复杂后，只公开Protocol文件决定业务对外能力
// ServiceWithCachedProtocol 缓存使用
  
Class <LFLVipProtocol> vipService = ServiceWithProtocol(LFLVipProtocol);
  
if (vipService && [vipService isCurrentUserVipStatus]) {
  [ServiceWithCachedProtocol(LFLPlayProtocol) playMiniVideo];
} else {
  NSLog(@"Error:LFLVipProtocol notfound service Class");
}

```

-  对外业务能力如果未实现，运行期调用会触发断言处，便于发现问题。 ✅

-  recommended convention

    -   `XXX`Service

    -   `XXX`Protocol

-  项目已存在或者想自由风格命名：**Map解决方案**

```objc

NSDictionary *mapDic = @{
    @"LFLUnRuleProtocol":@"LFLTestRuleIMP"
};
[[ProtocolServiceManger sharedManger]configProtocolServiceMapsWithDic:mapDic];

```

## Swift Example  

```Swift 

let testSerivce : AnyClass = ProService.sharedManger().serviceClass(with:SwiftTestProtocol.self)

testSerivce.demo()

@objc public protocol SwiftTestProtocol {
    
   static func demo()
}

import Foundation

class SwiftTestService:SwiftTestProtocol {
    
  static  public func demo() {
      print("SwiftTestService")
    }
    
}


```

Author
------

DevdragonLi, dragonLi_52171\@163.com

License
-------

ProtocolServiceKitis available under the MIT license. See the LICENSE
file for more info.
