function wlt -a usrname passwd type time
  echo -e "uname:\t $usrname" 
  switch $type 
    case 0
      set ck "教育网出口(国际,仅用教育网访问,适合看文献)"
    case 1
      set ck "电信网出口(国际,到教育网走教育网)"
    case 2
      set ck "联通网出口(国际,到教育网走教育网)"
    case 3
      set ck "电信网出口2(国际,到教育网免费地址走教育网)"
    case 4
      set ck "联通网出口2(国际,到教育网免费地址走教育网)"
    case 5
      set ck "电信网出口3(国际,默认电信,其他分流)"
    case 6
      set ck "联通网出口3(国际,默认联通,其他分流)"
    case 7
      set ck "教育网出口2(国际,默认教育网,其他分流)"
    case 8
      set ck "移动网出口(国际,无P2P或带宽限制)"
    case '*'
      set ck "未知出口, 设置默认教育网出口"
      set type 0
  end
  echo -e "type:\t $ck" 

  switch $time 
    case 0
      set sj "永久"
    case 120
      set sj "动态"
    case 3600
      set sj "1小时"
    case 14400
      set sj "4小时"
    case 39600
      set sj "11小时"
    case 50400
      set sj "14小时"
    case '*'
      set sj "未知时间, 设为默认 4 小时"
      set time 0
  end
  echo -e "time:\t $sj"
  curl --data "name=$usrname&password=$passwd&cmd=set&type=$type&exp=$time" http://wlt.ustc.edu.cn/cgi-bin/ip > /dev/null
end

