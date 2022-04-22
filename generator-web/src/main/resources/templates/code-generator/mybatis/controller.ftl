package com.guosen.platform.faas.sys.controller;
<#if isAutoImport?exists && isAutoImport==true>
import org.springframework.stereotype.Controller;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import java.util.List;
</#if>

/**
 * @description ${classInfo.classComment}
 * @author ${authorName}
 * @date ${.now?string('yyyy-MM-dd')}
 */
@RestController
@RequestMapping(value = "/${classInfo.className?uncap_first}")
public class ${classInfo.className}Controller {

    @Autowired
    private ${classInfo.className}Service ${classInfo.className?uncap_first}Service;

    /**
    * 新增
    **/
    @PostMapping
    public RestfulResponse insert(@Validated @RequestBody ${classInfo.className}DTO ${classInfo.className?uncap_first}DTO){
        return RestfulResponse.success(${classInfo.className?uncap_first}Service.insert(${classInfo.className?uncap_first}DTO));
    }

    /**
    * 刪除
    **/
    @DeleteMapping("/{id}")
    public RestfulResponse delete(@PathVariable Long id){
        return RestfulResponse.success(${classInfo.className?uncap_first}Service.delete(id));
    }

    /**
    * 更新
    **/
    @PutMapping
    public RestfulResponse update(@Validated @RequestBody ${classInfo.className}DTO ${classInfo.className?uncap_first}DTO){
        return RestfulResponse.success(${classInfo.className?uncap_first}Service.update(${classInfo.className?uncap_first}DTO));
    }

    /**
    * 查询 分页查询
    **/
    @GetMapping("/list")
    public RestfulResponse getList(@RequestParam(defaultValue = "1") int page,
                                    @RequestParam(defaultValue = "10") int limit,
                                    @RequestParam(required = false) String keyword) {
       return RestfulResponse.success(${classInfo.className?uncap_first}Service.getList(page, limit, keyword));
    }

}
