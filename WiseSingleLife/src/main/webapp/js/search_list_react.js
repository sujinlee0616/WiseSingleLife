	class App extends React.Component{
		constructor(props){
			super(props);
			this.state={
				homeplus:[],
				keyword:''
			}
			this.onUserInput2=this.onUserInput2.bind(this);
		}						

		onUserInput2(keyword){
			axios.get("http://localhost:8081/web/hp/search.do",{
				params: {
					keyword:keyword
				}.then(function(result){
					console.log(result.data);
					this.setState({homeplus:result.data});
				})
				
			});
	
			
			this.setState({keyword:keyword});
		}

		
		render(){
			return(
				document.write(<div className="row">
					<SearchBar keyword={this.state.keyword} onUserInput={this.onUserInput2} />
				</div>);	
			);
		}
	}
	class SearchBar extends React.Component{
			constructor(props)
			{
				super(props);
				// / /이벤트 등록
				this.onChange=this.onChange.bind(this)
				this.onClick=this.onClick.bind(this)
				// / /this.onUserInput = this.onUserInput.bind(this)
			}
			onClick(e)
			{
				elem = documnet.getElementById("keyword");
				this.props.onUserInput(elem.value);
			}
			render(){
				return(	
					<div className="slider_search_area">
						<input className="img_slider_search" type="search" placeholder="검색어를 입력하세요."
						value={this.props.keyword} id="keyword"/>
						<button className="sliderBtn" onClick={this.onClick}>검색</button>
					</div>
				)
			}
		}
		ReactDOM.render(<App />, document.getElementById('root'));