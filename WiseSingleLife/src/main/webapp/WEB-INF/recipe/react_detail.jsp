<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
<div id="app"></div>
<script src="https://cdnjs.cloudflare.com/ajax/libs/react/0.14.0/react.js"></script> 
<script src="https://cdnjs.cloudflare.com/ajax/libs/react/0.14.0/react-dom.js"></script> 
<script src="https://cdnjs.cloudflare.com/ajax/libs/babel-core/5.8.23/browser.min.js"></script>
<script src="https://unpkg.com/axios/dist/axios.min.js"></script>
</body>
<script type="text/babel">
	const URL = "http://localhost:8079/web/"

	class App extends React.Component{
		constructor(props) {
			super(props);
			this.state = {
				no:153,
				title:'',
				chef:'',
				info1:'',
				info2:'',
				info3:'',
				intro:'',
				recipe:''
			}
			this.setTitle=this.setDetailResults.bind(this);
		}

		setDetailResults(){
			axios.get(URL+"recipe_detail_react_data.do",{
				params: {
					no:this.state.no
				}
			}).then((result)=>{
				this.setState({
					title:result.data.title,
					chef:result.data.chef,
					info1:result.data.info1,
					info2:result.data.info2,
					info3:result.data.info3,
					intro:result.data.intro,
					recipe:result.data.recipe
				});
			});
		}		

		render(){
			return (
				<div>
					<h1>Hello, world!</h1>
				</div>
			);
		}
	}

	ReactDOM.render(<App />, document.getElementById('app'));
</script>

</html>