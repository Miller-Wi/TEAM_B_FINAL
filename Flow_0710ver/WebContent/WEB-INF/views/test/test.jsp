<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
    <link href="https://cdnjs.cloudflare.com/ajax/libs/jqcloud/1.0.4/jqcloud.css" rel="stylesheet"/>
<script src="https://cdnjs.cloudflare.com/ajax/libs/jqcloud/1.0.4/jqcloud-1.0.4.js"></script>
    
<!-- Ÿ��Ʋ -->
	<div class="head_tit">
		<h3>�α���</h3>
		<ul class="navy">
			<li class="home"><img src="../../images/ico_head_title_home.png"
				alt="Ȩ" /></li>
			<li>��������</li>
			<li>�α���</li>
		</ul>
	</div>

	<!-- �α��� -->
		<div class="loginTop">
			<div id="jqcloud"></div>
		</div>

	


	<!-- //�α��� -->
		<script>
//     const keyword = ['foo','bar', 'baz'].map(keyword => ({
// 	  text: keyword,
// 	  handlers: {
// 	    click: () => {
// 	      alert('you clicked on "' + keyword + '"');
// 	    }
// 	  }
// 	}));
    var keyword = [
     {text: "Lorem", weight: 15},
     {text: "Ipsum", weight: 9, link: "http://jquery.com/"},
     {text: "Dolor", weight: 6, html: {title: "I can haz any html attribute"}},
     {text: "Sit", weight: 7},
     {text: "Amet", weight: 5}
     // ...as many words as you want
 ];
	$(function() {
		var tags = [
		    "Delegation", "Composition", "Aggregation","Java","Java","Java","Java","Java","Java","Java","Java","Java","Java","Java","Java","Java","Java","Java","Java","Java","Java","Java","Java","Java","Java", "Design Pattern", "Lazy-Initialization", "JCF", "HashSet", "TreeSet", "LinkedHashSet", "Map", "IdentityHashMap", "List", "ArrayList", "Design-Pattern", "Singleton", "MultiThreading", "Template-pattern", "Set", "Ordering", "LinkedList", "Java-puzzle", "Visitor", "PathMatcher", "thread", "exception-handling", "kill-thread", "FP", "Functional-programming", "Scala", "Algorithm", "convert-array-dimension", "toString", "Closure", "Currying", "JavaScript", "RegEx", "����,����,�ѱ� �Է� ����", "Literal", "Multi-threads", "Constructor", "Generics", "Lower-bound", "Upper-bound", "ReactiveX", "Mixin", "Case Class",  "singleton", "companion", "��Į��", "�Լ������", "Docker", "homebrew", "Spring", "Spring-boot", "fork-join", "Git", "branching", "�귣Ī",  "logstash", "kibana", "�α׽��׽�", "����ƽ��ġ", "Ű�ٳ�", "Pro-git", "Jekyll", "tag-search", "ī�װ��˻�", "�±װ˻�", "ī�װ��˻�", "�±װ˻�", "ī�װ��˻�", "�±װ˻�", "ī�װ��˻�", "�±װ˻�", "ī�װ��˻�", "�±װ˻�", "tag-cloud", "Angular4", "Data binding", "Directive", "Axon", "CQRS",  "Secure Coding", "recruit", "ripple", "����", "����", "Toss", "OAuth2", "ESLint", "Tomcat", "JNDI"
		  ]

		  var words = [];
		  tags.forEach(t => {
		    var key = t;
		    if (words[key]) {
		      words[key] = words[key] + 1;
		    } else {
		      words[key] = 1;
		    }
		  });
		  var tagCloudWords = Object.keys(words).map(w => {
		    return {
		      text: w, weight: words[w], link: '/search/?tag=' + w
		    };
		  });
		  $('#jqcloud').jQCloud(tagCloudWords,
		    {
		      height: 400,
		      autoResize: true,
// 		      fontSize: { from: 0.1, to: 0.01 }
		    }
		  );
	 });



	</script>