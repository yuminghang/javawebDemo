import bean.bean;
import bean.ruisibean;
import org.jsoup.Jsoup;
import org.jsoup.nodes.Document;
import org.jsoup.nodes.Element;
import org.jsoup.select.Elements;

import java.io.*;
import java.net.URL;
import java.net.URLConnection;
import java.util.ArrayList;
import java.util.List;

/**
 * Created by ymh on 2016/12/30.
 */
public class Craw {
    private static final String USER_AGENT = "Mozilla/5.0 (Windows NT 6.3; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/50.0.2661.102 Safari/537.36";

    public static String fetchURL(String preHomeUrl) {
        StringBuilder sb = new StringBuilder();
        URL url = null;
        try {
            url = new URL(preHomeUrl);
            URLConnection connection = url.openConnection();
//            connection.setRequestProperty("User-Agent", USER_AGENT);
            InputStream is = connection.getInputStream();
            Reader r = new InputStreamReader(is, "utf-8");
            BufferedReader bufferedReader = new BufferedReader(r);
            String line = "";
            while ((line = bufferedReader.readLine()) != null) {
                sb.append(line);
            }
        } catch (IOException e) {
            return "";
        }
        return sb.toString();
    }

    public static List<bean> praseData(String result) {
        List<bean> res = new ArrayList<>();
        Document doc = Jsoup.parse(result);
        Elements elements = doc.select("li.j_thread_list");
        int num = 0;
        for (Element element : elements) {
            String temp = element.select("span.threadlist_rep_num").text();
            if (temp.length() > 0) {
                num = Integer.parseInt(temp);
                String title = element.select("div.threadlist_title").select("a").attr("title");
                String url = "http://tieba.baidu.com" + element.select("div.threadlist_title").select("a").attr("href");
                bean data = new bean(title, url, num);
                System.out.println(data.toString());
                res.add(data);
            }
        }
        return res;
    }

    public static List<ruisibean> praseData1(String result) {
        List<ruisibean> res = new ArrayList<ruisibean>();
        Document doc = Jsoup.parse(result);
        Elements elements = doc.select("div.threadlist").select("ul.hotlist").select("li");
        for (Element element : elements) {
            String url = "http://bbs.rs.xidian.me/" + element.select("a").attr("href");
            String title = element.select("a").text();
            String author = element.select("span.by").text();
            String num = element.select("span.num").text();
            ruisibean bean = new ruisibean(title, url, author, num);
            System.out.println(bean.toString());
            res.add(bean);
        }
        return res;
    }
}
