layui.use('table', function(){
  var table = layui.table;

  table.render({
    elem: '#menuTable',
    url:'/menu/list',

    toolbar: '#toolbarDemo',

    defaultToolbar: ['filter', 'exports', 'print', {
      title: '提示'
      ,layEvent: 'LAYTABLE_TIPS'
      ,icon: 'layui-icon-tips'
    }],
    title: '菜单表',
    cols: [[
      {
        type: 'checkbox',
        fixed: 'left'
      },
      {
        field:'menuId',
        title:'ID',
        width:80,
        fixed: 'left',
        unresize: true,
        sort: true
      },
      {
        field:'menuName',
        title:'菜单名称',
        width:120,
        edit: 'text'
       },
      {
        field:'url',
        title:'地址',
        width:150,
        edit: 'text',
        templet: function(res){
          return '<em>'+ res.email +'</em>'
        }
      },
      {
        field:'menuType',
        title:'菜单类型',
        width:80,
        edit: 'text',
        sort: true
      },
      {
        field:'city',
        title:'城市',
        width:100
      }
      ,{field:'orderNum', title:'加入时间', width:80}
      ,{field:'createUser', title:'创建者', width:120}
      ,{field:'createTime', title:'创建时间', width:120, sort: false}
      ,{field:'updateUser', title:'更新者', width:120}
      ,{field:'updateTime', title:'更新时间', width:100, sort: false}

      ,{fixed: 'right', title:'操作', toolbar: '#barDemo', width:150}
    ]]
    ,page: true
  });


  table.on('toolbar(menuTable)', function(obj){
    var checkStatus = table.checkStatus(obj.config.id);
    switch(obj.event){
      case 'getCheckData':
        var data = checkStatus.data;
        layer.alert(JSON.stringify(data));
      break;
      case 'getCheckLength':
        var data = checkStatus.data;
        layer.msg('选中了：'+ data.length + ' 个');
      break;
      case 'isAll':
        layer.msg(checkStatus.isAll ? '全选': '未全选');
      break;


      case 'LAYTABLE_TIPS':
        layer.alert('这是工具栏右侧自定义的一个图标按钮');
      break;
    };
  });


  table.on('tool(menuTable)', function(obj){
    var data = obj.data;

    if(obj.event === 'del'){
      layer.confirm('真的删除行么', function(index){
        obj.del();
        layer.close(index);
      });
    } else if(obj.event === 'edit'){
      layer.prompt({
        formType: 2
        ,value: data.email
      }, function(value, index){
        obj.update({
          email: value
        });
        layer.close(index);
      });
    }
  });
});
