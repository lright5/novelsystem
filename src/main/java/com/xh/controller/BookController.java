package com.xh.controller;

import com.github.pagehelper.PageInfo;
import com.xh.dto.ResultData;
import com.xh.pojo.Book;
import com.xh.pojo.Chapter;
import com.xh.pojo.Message;
import com.xh.service.AuthorService;
import com.xh.service.BookService;
import com.xh.service.MessageService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import java.io.UnsupportedEncodingException;
import java.util.ArrayList;
import java.util.List;

@Controller
public class BookController {

    @Autowired
    private BookService bookService;
    @Autowired
    private MessageService messageService;

//    @Autowired
//    private BookService bookService;
    //小说列表
    @RequestMapping("/book/list")
    public String list(Model model,
                       @RequestParam(defaultValue = "1") Integer page,
                       @RequestParam(defaultValue = "3") Integer pageSize) {



        PageInfo<Book> pageInfo=bookService.list(page,pageSize);


        model.addAttribute("list",pageInfo.getList());
        model.addAttribute("pageInfo",pageInfo);






        return "book/book-list";
    }

    //小说添加
    @RequestMapping("/book/addPage")
    public String addPage() {
        return "book/book-add";
    }
//

    @Autowired
    private AuthorService authorService;


//    //    添加小说
    @RequestMapping("/book/add")
    @ResponseBody
    public ResultData add(Book book, HttpServletRequest request) {

        Integer currentLoginAuthorId = (Integer) request.getSession().getAttribute("currentLoginAuthorId");
        book.setAuthorId(currentLoginAuthorId);
        book.setAuthor(authorService.findById(currentLoginAuthorId).getAuthorName());

        return bookService.add(book);
    }

//    编辑小说状态
    @RequestMapping("/book/editCondition")
    @ResponseBody
    public ResultData editCondition(Integer bookId, Integer condition){
        return bookService.updateStatus(bookId,condition);
    }

//    编辑页面
    @RequestMapping("/book/editPage")
    public String editPage(Model model, Integer bookId){
        Book dbBook = bookService.findById(bookId);
        model.addAttribute("book",dbBook);

        return "book/book-edit";
    }
//更新基本信息
    @RequestMapping("/book/edit")
    @ResponseBody
    public ResultData edit(Book book, HttpServletRequest request) {
        Integer currentLoginAuthorId = (Integer) request.getSession().getAttribute("currentLoginAuthorId");
        book.setAuthorId(currentLoginAuthorId);
        book.setAuthor(authorService.findById(currentLoginAuthorId).getAuthorName());


        return  bookService.edit(book);
    }


//    批量删除
    @RequestMapping("/book/deleteAll")
    @ResponseBody
    public ResultData deleteAll(@RequestParam(name="ids") String ids){
        //将ids转为数组
        String[] idArr = ids.split(",");
        //将字符串数组转为int数组
        return bookService.batchDelete(idArr);

    }

    //    search
    @RequestMapping("/book/search")
    public String searchList(Model model,
                             @RequestParam(defaultValue = "1") Integer page,
                             @RequestParam(defaultValue = "3") Integer pageSize,
                             String keyword) {
        PageInfo<Book> pageInfo=bookService.searchList(page,pageSize,keyword);

        model.addAttribute("list",pageInfo.getList());
        model.addAttribute("pageInfo",pageInfo);
        return  "book/book-list";
    }

    @RequestMapping("/book/search1")
    public String searchList1(Model model,
                             @RequestParam(defaultValue = "1") Integer page,
                             @RequestParam(defaultValue = "3") Integer pageSize,
                             String keyword1) {
        PageInfo<Book> pageInfo=bookService.searchList1(page,pageSize,keyword1);

        model.addAttribute("list",pageInfo.getList());
        model.addAttribute("pageInfo",pageInfo);
        return  "book/book-list";
    }


    @RequestMapping(value = "/book/getByType",method = RequestMethod.GET)
    public String getByType(Integer bookType, Model model, HttpSession session){
        List<Book> bookList = bookService.findByType(bookType);
        List<Book> randList = bookService.findRandList();
        //将字符串数组转为int数组
        session.setAttribute("bookList",bookList);
        session.setAttribute("randList",randList);
        return "/front/personal";
    }

    @RequestMapping(value = "/book/getByName",method = RequestMethod.POST)
    public String getByName(String likeName, Model model, HttpSession session) throws UnsupportedEncodingException {
       // String likeName1 = new String(likeName.getBytes("ISO-8859-1"),"utf-8");
        List<Book> bookList = bookService.findByLikeName(likeName);
        List<Book> randList = bookService.findRandList();
        //将字符串数组转为int数组
        session.setAttribute("bookList",bookList);
        session.setAttribute("randList",randList);
        return "/front/personal";
    }

    @RequestMapping(value = "/shiduPage",method = RequestMethod.GET)
    public String shiduPage(Integer bookId,Integer page,Model model){
        Book book = bookService.findById(bookId);
        Chapter chapter = book.getChapterList().get(page-1);
        int totalPage= book.getChapterList().size();
        List<Chapter> chapterList = new ArrayList<>();
        chapterList.add(chapter);
        book.setChapterList(chapterList);
        model.addAttribute("book",book);
        model.addAttribute("page",page);
        model.addAttribute("totalPage",totalPage);
        return "shidu";
    }

    @RequestMapping(value = "/novelPage",method = RequestMethod.GET)
    public String novelPage(Integer bookId, Model model){
        Book book = bookService.findById(bookId);
        List<Message> messageList = messageService.findByBookId(bookId);

        model.addAttribute("book",book);
        model.addAttribute("messageList",messageList);
        return "novel";
    }


}
