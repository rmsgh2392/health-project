var protein_vue = protein_vue || {}
protein_vue = {
	protein_body: x=>{
		return `
		<br />
		<h3>`+sessionStorage.getItem('userid')+`님이 섭취해야할 단백질을 채워줄 음식</h3>
		<p>식품안전나라(www.foodsafetykorea.go.kr)출처</p>
		<div id="food"></div>
		`	
	}
}