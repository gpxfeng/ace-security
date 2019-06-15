# ace-security
## 说明
项目是基于Cloud-Admin开发脚手架,具有统一授权、认证后台管理系统,其中包含具备用户管理、资源权限管理、网关API管理等多个模块,支持多业务系统并行开发,
代码简洁,架构清晰。核心技术采用`Spring Boot2`以及`Spring Cloud (Finchley.M8)`相关核心组件,
前端采用`vue-element-admin`组件。

#### 服务鉴权
老A独有的通过`JWT`的方式来加强服务之间调度的权限验证，保证内部服务的安全性。

#### 监控
利用Spring Boot Admin 来监控各个独立Service的运行状态,利用Hystrix Dashboard来实时查看接口的运行状态和调用频率等。

#### 负载均衡
将服务保留的rest进行代理和网关控制,除了平常经常使用的node.js、nginx外,Spring Cloud系列的zuul和ribbon，可以帮我们进行正常的网关管控和负载均衡。其中扩展和借鉴国外项目的扩展基于JWT的`Zuul限流插件`，方面进行限流。

#### 服务注册与调用
基于Eureka来实现的服务注册与调用,在Spring Cloud中使用Feign, 我们可以做到使用HTTP请求远程服务时能与调用本地方法一样的编码体验,开发者完全感知不到这是远程方法,更感知不到这是个HTTP请求。

#### 熔断机制
因为采取了服务的分布,为了避免服务之间的调用“雪崩”,采用了`Hystrix`的作为熔断器,避免了服务之间的“雪崩”。

#### 缓存机制
项目中springcloud redis mybaits整合 在ace-auth模块创建RedisConfiguration配置类,在ace-admin模块的biz上添加注解@Cache(key="user{1}")
基于spring boot上的注解缓存，自带轻量级缓存管理页面。@Cache和@CacheClear比spring cache更轻量的缓存，支持单个缓存设置过期时间，可以根据前缀移除缓存。

### 目标新功能
- 1:代码生成器功能
- 2:增加用户注册或者是管理员新增用户  等要买服务器,实现第三方登录 
- 3:爬虫项目引入
- 4:增加百度地图
- 5:增加系统搜索，把原生Lucene换成Elasticsearch

### 遗留问题
多进程单线程和多线程单进程有何优点，有何缺点


### 项目结构
```
ace-security
│  
├─ace-auth--------------------服务鉴权中心 
│     │
│     ├─ace-auth-client-------鉴权操作类
│     │
│     ├─ace-auth-common-------鉴权接口
│     │
│     └─ace-auth-server-------鉴权服务实现
│
├─ace-center------------------服务注册中心
│  
├─ace-common------------------通用脚手架(base,utils继承实现)
│  
├─ace-control-----------------运维中心(监控、链路) 
│     │
│     ├─ace-monitor-----------健康监控机制
│     │
│     └─ace-trace-------------zipkin分布式跟踪系统(追踪日志存储需要执行sql脚本，注册服务)
│  
├─ace-gate--------------------网关负载中心
│     │
│     ├─ace-gate-ratelimit----基于令牌桶算法的实现类,配置拦截器内容,完成限流
│     │
│     ├─ace-gate-zuul---------feign通信服务配置,网关设置
│     │
│     └─ace-gateway-v2--------上面模块的简约配置,实现现有模块功能
│ 
├─ace-modules-----------------公共服务模块（功能）
│     │
│     ├─ace-admin-------------基础系统,用户登录,菜单、用户、模块等功能增删改查
│     │
│     ├─ace-generator---------代码生成器
│     │
│     ├─ace-interface---------接口,类似dto
│     │
│     ├─ace-tool--------------搜索模块，目前是lucene，ik分词器,对象存储:OSS,云存储
│     │
│     └─ace-vod---------------java爬虫,webmagic框架
│ 
```
## 后端工程启动
### 环境须知
- mysql一个,redis一个,rabbitmq一个 
- jdk1.8   vod编译需要1.9
- IDE插件一个，`lombok插件`,否则你的IDE会报代码缺失。
- 后端的服务必须先启动,在后端服务启动完成后,再启动前端的工程。
- redis设置win开机自启动,cmd窗口进入文件夹:redis-server –service-install redis.windows.conf
- 安装Erlang,并设置环境变量 安装rabbitmq


### 运行步骤
- 运行数据库脚本:依次运行数据库：ace-admin/db/init.sql-----ace-auth-server/db/init.sql  运行sql脚本
- 修改配置数据库配置:ace-admin/src/main/resources/application.yml------ace-gate/src/main/resources/application.yml  
- 按`顺序`运行main类:
- CenterBootstrap(ace-center)-------------注册中心
- AuthBootstrap(ace-auth-serve)-----------鉴权服务
- AdminBootstrap(ace-admin)---------------用户服务
- GatewayServerBootstrap(ace-gateway-v2)--网关服务


## 前端工程启动[vueAdmin](https://github.com/gpxfeng/vueAdmin)


## java笔记
- 把List<String>里的所有元素变成一个字符串  StringUtils.join(string1.toArray(), ",")
- 后端接收json数据要加@requestbody
- spring cache框架,缓存注解@Cacheable   用在方法上表示:该方法的返回值将被缓存起来
- web.xml里的servlet-mapping下的url-pattern，控制了springMVC的url请求后缀
- ace-admin里BCrypt加密: BCrypt.hashpw(password, BCrypt.gensalt()) ,后面的参数是所说的加盐,checkpw()是比对,一样返回true
- java9模块化的概念使得JAXB默认没有加载,jaxb-api是存在jdk中的,idea打开Modules，添加jdk手动引入
- java9以后,sun.misc.BASE64Decoder和sun.misc.BASE64Encoder不可用,api删除了,换成java.util.Base64.Decoder和java.util.Base64.Encoder    代码↓
-      Base64.getEncoder().encodeToString(b)
-      Base64.getDecoder().decode(s)
- 项目用到了feign,pox文件要加 spring-boot-starter-web 依赖
------
- list去重保持顺序
```
  List<String> stringList = new ArrayList<String>();
          Set set = new HashSet();
          List newList = new ArrayList();
          for (Iterator iter = stringList.iterator(); iter.hasNext();) {
              Object element = iter.next();
              if (set.add(element))
                  newList.add(element);
          }
  stringList.clear();
  stringList.addAll(newList);
```
- map遍历三种
```
1
for(String key:map.keySet()){//keySet获取map集合key的集合  然后在遍历key即可
                String value = map.get(key).toString();//
                System.out.println("key:"+key+" vlaue:"+value);
            }
2
Iterator<Entry<String, Object>> it = map.entrySet().iterator();
           while(it.hasNext()){
                Entry<String, Object> entry = it.next();
                System.out.println("key:"+entry.getKey()+"  key:"+entry.getValue());
          }
3    推荐，尤其是容量大时
for (Map.Entry<String, Object> m : map.entrySet()) {
        System.out.println("key:" + m.getKey() + " value:" + m.getValue());
    }
```
- 不要在 foreach 循环里进行元素的 remove/add 操作,remove 元素请使用 Iterator方式，如果并发操作,需要对 Iterator 对象加锁
```
  Iterator<String> iterator = list.iterator(); 
  while (iterator.hasNext()) {
  String item = iterator.next();
    if (删除元素的条件) {
         iterator.remove();
     }
  }
```
- 深拷贝不仅拷贝对象本身,而且拷贝对象包含的引用指向的所有对象。浅拷贝就只拷贝对象属性,对象中的基本变量,引用地址不拷贝
- 在entry转化为dto时,如果字段太多,并且需要全部转化时,应该使用支持浅拷贝或深拷贝的Utils  文章链接https://juejin.im/post/5ce7e78d518825064000531a  
```
  这样就少写了全部的get，set方法
  @RequestMapping("/v1/api/user")
  @RestController
  public class UserApi {
  
      @Autowired
      private UserService userService;
  
      @PostMapping
      public User addUser(UserInputDTO userInputDTO){
          User user = new User();
          user.setUsername(userInputDTO.getUsername());
          user.setAge(userInputDTO.getAge());
  
          return userService.addUser(user);
      }
  }
  变成了下面这样
  @PostMapping
   public User addUser(UserInputDTO userInputDTO){
           User user = convertFor(userInputDTO);
  
           return userService.addUser(user);
   }
  
   private User convertFor(UserInputDTO userInputDTO){
  
           User user = new User();
           BeanUtils.copyProperties(userInputDTO,user);
           return user;
   }
  后续还可以抽取抽象接口，做好泛型。
  public interface DTOConvert<S,T> {
      T convert(S s);
  }
```
------
## 爬虫笔记
- webmagic的xpath不支持last()函数,使用jsoup 使用方式:https://www.open-open.com/jsoup/
- 页面Console输入 window.navigator.webdriver 结果为true,判定为机器人,使用开发者模式    options.setExperimentalOption("excludeSwitches",new String[]{"enable-automation"});
- 控制ChromeDriver线程过多
```
 ChromeDriverService service = new ChromeDriverService.Builder().usingDriverExecutable(new File(CHROMEDRIVERPATH)).usingAnyFreePort().build();
            try {
                service.start();
            } catch (IOException e) {
                e.printStackTrace();
            }

 webDriver.quit();
 service.stop();
```
- recaptcha谷歌验证码  破解方式使用语音    反爬措施:限制ip、验证码、滑动验证、用户登录等 
- nutch分布式爬虫,关键词:搜索引擎、爬虫、seo
- FFMPEG用于处理音视频,常用命令

## linux笔记
- 重启reboot 

- docker操作
- systemctl enable docker 设置docker开机自启动
- service docker restart   重启
- docker start stop restart rm <id> 容器操作
- docker ps -a  没有-a就是查看正在运行的
- docker images：列出镜像
- docker rmi  <image ID>删除镜像 docker search <image>搜索镜像 docker pull <image>拉取镜像
- docker exec -it containerID /bin/bash #进入容器  ctrl+p+q 退出容器但不关闭 
- docker run  太多,看书签 https://www.cnblogs.com/shenh/p/9225351.html
-------
- maven安装 
- 下载上传解压  vim /etc/profile配置环境变量
- export M2_HOME=/usr/local/maven/apache-maven-3.6.1
- export PATH=$PATH:$JAVA_HOME/bin:$M2_HOME/bin
- 重启配置source /etc/profile   mvn -v 查看
-------
- docker部署注册中心
- idea命令maven-package打成jar包,jar包和dockerFile上传到同一文件夹
- 运行dockerFile命令  生成镜像 docker build -t ace-center    docker images 查看
- docker run -p 8761:8761 -d ace-center  运行注册中心
-------
- redis安装
```
$ mkdir redis
$ chmod 755 redis
$ cd redis
$ wget http://download.redis.io/releases/redis-5.0.5.tar.gz
$ tar xzf redis-5.0.5.tar.gz
$ cd redis-5.0.5
$ make
$ sudo make install
$ redis-server &       后台运行
$ ps aux | grep redis  查看状态
$ kill -9 PID          关闭线程
$ vi ../redis.conf
bind 127.0.0.1 使用#注释掉
protected-mode yes 改为 protected-mode no

$ redis-cli
修改redis的保护模式为no，不启用
127.0.0.1:6379> config set protected-mode no
或者 config set requirepass 123 ->123是密码

redis-cli -h ip地址 -p 6379   远程连接
```
- redis清缓存
- win----src/redis-cli      linux----cd src/redis-cli
- 127.0.0.1:6379>dbsize
- 127.0.0.1:6379>flushall
- 127.0.0.1:6379>exit


## idea使用
- 使用git上传到github   https://www.cnblogs.com/jinjiyese153/p/6796668.html
#### 常用快捷键
- 1.CTR+N             搜索类
- 2.CTR+SHIT+N        搜索文件
- 3.CTR+ALT+空格      代码提示（类似于ALT+/）
- 4.ALT+F7            查询在某处使用
- 5.CTR+Q             查看代码提示及内容
- 6.CTR+B             查看类的声明 还可以直接按住：CTR 再点击鼠标 （和eclipse的用法是一样的）
- 7.CTR+F12           查看文件列表（File Structure）
- 8.SHIFT+F6          重命名（按住ENTER）重命名成功。
- 12 ALT+INSERT       生成getter和setter的方法  在pom.xml文件里alt+insert可以选第一个进行导包
- 14 CTR+ALT+T        选中某一个段代码进行try catch
- 15 CTR+SHIT+空格    新建类时  在new 后面使用 （提示自动创建类）
- 16 CTR+ALT+B        查看接口或者抽象类的子类。
- 17.CTR+SHIT+/       注释（整体注释）
- 18.CTR+/            行注释
- 19.CTR+D            换行 并复制
- 20.Ctrl+Alt+L       整理代码格式
- 21.CRT+O            重写超类方法
- 22.Alt+Enter        在分号之前,选择强转类型
- 23.Ctrl+Shift+t     放在接口类上生成单元测试
- 24. Ctrl+R          替换
- 25.Ctrl + Alt + M   代码块抽取
- 26.生成实现类        接口的名称处按 Alt+Enter 单击Implement interface
- 27.ctrl + alt +B    查找接口的实现类
- 28.CTRL + F12       显示类中的变量、方法

### 基本功能
![img](http://upload-images.jianshu.io/upload_images/5700335-002735d1727ec11b.jpg?imageMogr2/auto-orient/strip%7CimageView2/2/w/1240)

![img](http://upload-images.jianshu.io/upload_images/5700335-e5e56924aaeacf1e.jpg?imageMogr2/auto-orient/strip%7CimageView2/2/w/1240)



