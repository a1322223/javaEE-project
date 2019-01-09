package controller;

import model.Record;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.*;

import service.RecordService;

@Controller
@RequestMapping("recurd")
public class RecordController extends BaseController {

    private final RecordService recurdService;

    @Autowired
    public RecordController(RecordService recurdService) {
        this.recurdService = recurdService;
    }

    @RequestMapping("create")
    private String create(Record record) {
        recurdService.create(record);
        return "redirect:/record/queryAll";
    }

    @RequestMapping("remove/{id}")
    private String remove(@PathVariable("id") Integer id) {
        recurdService.remove(id);
        return "redirect:/recurd/queryAll";
    }

    @RequestMapping("modify")
    private String modify(Record record) {
        recurdService.modify(record);
        return "redirect:/record/queryAll";
    }

    @RequestMapping("queryAll")
    private String queryAll() {
        session.setAttribute("list", recurdService.queryAll());
        return "redirect:/recurd/list.jsp";
    }

    @RequestMapping("queryById/{id}")
    private String queryById(@PathVariable("id") Integer id) {
        session.setAttribute("recurd", recurdService.queryById(id));
        return "redirect:/recurd/edit.jsp";
    }
}