# Dev.Kim-Web-site
 🔭 첫째로는 제가 사용할 수 있는 언어들과 제가 했던 프로젝트와 개인 정보들을 기입함으로써 보기 쉽게 하기위해 제작하였습니다.<br>
 🔭 두번째로는 이번 개발 동아리에서 진행한 JSP 스터디를 마치고 나서 로그인폼과 게시판을 직접 만들어보는 역할을 진행해보고자 제작하였습니다.
<br>
<br>

 ## 1. 개발 환경
 🔎 Apache Tomcat Server 9.0 <br>
 🔎 Eclipse Developer version <br>
 🔎 jdk 1.8.0  <br>
 🔎 JSP, CSS, HTML 사용 <br>
 🔎 Oracle Developer <br>
 🔎 Oracle 11g <br>
 
 
## 2. 🎨 홈페이지의 구성 🎨
![image](https://user-images.githubusercontent.com/94120988/188257821-23a80e0b-11bd-4fcf-9d1d-cccd26994071.png)
 여기가 메인 홈페이지이고 메인 홈페지의 문구는 CSS를 넣어서 왼쪽에서 오른쪽으로 오게 만들었습니다!<br>
 전체적인 분위기는 제작을 하다보니 "넷플릭스" 홈페이지와 비슷하여 분위기를 살려보았습니다.
 
 ### 1-(1) Technologe 메뉴
 ![image](https://user-images.githubusercontent.com/94120988/188258355-2e9df63f-cfb4-4cff-82b8-d7c5116b2a51.png)
 제가 현재 사용할 수 있는 언어들 **c언어, html/css, java, jsp**를 아이콘으로 가져와서 디자인에 신경을 써서 제작했습니다.<br>

 ### 1-(2) Info 메뉴
 ![image](https://user-images.githubusercontent.com/94120988/188258539-38c4c392-16bc-479a-9d22-ed3d21f3b127.png)
 저의 개인 블로그와 공부한 것을 지속적으로 올리고 있는 저의 공스타그램의 링크, 깃허브까지 올려 놓았습니다!<br>
 
 ### 1-(3) LOGIN과 회원가입 폼
 ![image](https://user-images.githubusercontent.com/94120988/188259127-a46bee55-124b-4770-94c7-4b6fe8800714.png)
 ![image](https://user-images.githubusercontent.com/94120988/188262770-bc2fc785-1262-4bd3-9a1f-20a51637df32.png)
  학교 동아리 "ICNET"에서 공부했던 JSP를 응용해보고자 어떤 것이 있을까 생각 중 가장 대표적인 로그인 폼과 게시판을 구현했습니다.
  `OracleDeveloper` 에 저장되어 있는 아이디가 아니면 로그인이 되지 않습니다! <BR>
  회원가입에 폼대로 작성하고 입력하게 된다면 `OracleDeveloper` 에 저장이되고 넘어가게 됩니다.<br>
 
 ### 1-(4) 게시판 
 ![image](https://user-images.githubusercontent.com/94120988/188262951-ba4ca934-6da3-43dd-adf4-3b0ca44a52c3.png)
 게시판에서는 글 등록을 클릭하면 작성하는 form이 나오고 작성을 하고 글 등록을 하게되면 저렇게 게시판에 글이 추가가 되는 것을 볼 수 있습니다.<br>
 안에서는 수정과 삭제가 가능하고 조회수 또한 제목을 클릭할 때 count가 하나씩 증가되는 걸로 하여 시퀀스 값을 증가시키는 걸 구현하였습니다.<br>
