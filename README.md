# system32_executable_checker
* just toy
* 參考[惡意程式調查之權限異常](https://azx961585.pixnet.net/blog/post/48065173)與[產生資料夾權限清單](https://blog.darkthread.net/blog/list-dir-perm-w-ps/)製作的27行小玩具
* 檢查system32底下dll和exe的權限，不過權限沒有Trusterinstaller的檔案比想像中多，所以加了一個數位簽章的Status檢查，加入`-verbose`選項可以看到所有沒有Trusterinstaller權限的檔案簽章狀況
* 我的電腦上只有d3dref9.dll權限與簽章都沒過，不過丟virustotal沒有檢查出什麼，我不是鑑識專業的不確定這用不用得上，寫好玩的
![image](https://github.com/8U61ife/system32_executable_checker/blob/main/image1.png)