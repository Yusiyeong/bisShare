<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

    <style>
      .ex-layout{ height: 310px }
      .menu{
        width: 300px;
        height: 40px;
        border: 2px solid #09c;
        background-color: #d7f5ff;
      }
      .main .left-menu{
        float: left;
        width: 50px;
        height: 254px;
        border: 2px solid red;
        background-color: #ffe7d5;
      }
      .main .content{
        float: left;
        width: 250px;
        height: 250px;
      }
      .main .content .article{
        height: 200px;
        border: 2px solid blue;
        background-color: #e2e9ff;
      }
      .main .content .comment{
        height: 50px;
        border: 2px solid purple;
        background-color: #ffddff;
      }
    </style>
  <!-- Begin Page Content -->
  <div class="container-fluid">
    <!-- DataTales Example Start-->
    <div class="card shadow mb-4">
        <div class="card-header py-3">
            <h6 class="m-0 font-weight-bold text-primary" >글 작성</h6>
        </div>
        
        <div class="card-body">
          <!-- start-->
              <div class="ex-layout">
                  <div class="main">                 
                      <div class="content">
                        <div class="article">article</div>
                        <div class="comment">comment</div>
                      </div>
                      <div class="left-menu">left menu</div>
                  </div>
              </div>
          <!-- end-->
        </div>

</div>
<!-- DataTales Example End-->
</div>
<!-- End Page Content -->