# pinger
通过配置，检测IPv4或IPv6 地址或域名 是否是通的

* 下载原代码
<pre> #git clone https://github.com/leapv6/pinger </pre>
* 修改检测配置 
<pre> #cd pinger; vi ip.txt2 </pre>
* 定时检测
> 在系统定时任务中添加一条记录，每10min执行一次检测
<pre>
    #crontab -e
    记录：*/10 * * * * cd /home/pinger && ./pp.sh
</pre>

* 配置文件ip.txt2说明
<pre>
122.242.191.65|IPv6test|4
2001:250:221:1:3d:12:0:57f|ipv6test|6
</pre>
 >一行对应一个检测项，中间用｜隔开，总共3项<br/>
 第一项：检测的IPv4、IPv6 地址或域名<br/>
 第二项：检测的主体名称<br/>
 第三项:  检测类型 4为IPv4检测，6为IPv6检测<br/>
 
 * 检测结果
 > 现检测结果是发送给open-falcon, 也可以通过修改Ping.sh 做其他操作
 
 
