var center = center || {}
	center = (()=>{
			let context,css,js,img, map
			let location = {}
			let search_map_js
			let markers = []
			let places = []
			let init =()=>{
				context = $.ctx()
				css = $.css()
				js = $.js()
				img = $.img()
				search_map_js = js + '/vue/menu/search_map.js'
			}
			let onCreate =()=>{
				init()
				navigator.geolocation.getCurrentPosition(function(pos) {
					location.lat = pos.coords.latitude
					location.lng = pos.coords.longitude
				})
				$.when(
					$.getScript(search_map_js)
				)
				.done(()=>{
					setContentView()
					mapUi()
					goHome()
					
				})
				.fail(()=>{})
			}
			let goHome =()=>{
				$('#home').click(e=>{
					e.preventDefault()
					auth.login_home()
				})
			}
			let setContentView =()=>{
				$('.masthead2').remove()
				$('.page-footer').remove()
				$('#mainpage').empty()
				$('#mainpage').append(search_map.search(img))
				/*지도 크롤링
				 * $('<button/>',{
					text : '크롤링 하기',
					type : 'submit'
				})
				.appendTo('#placesList1')
				.click(e=>{
					$.getJSON(context + '/tx/crawling/center',d=>{
						if(d.msg === 'success'){alert(`크롤링 성공`)}
					})
				})*/
			}
			let center_table =x=>{
				$.getJSON(context + '/tx/info/'+x.currPage+'',d=>{
					let page = d.page
					let list = d.center
					$('#placesList1').empty()
					$(`<table id="tab">
					   <thead>
							<tr style="border : 1px solid black;">
							 <td style="border : 1px solid black;">이름</td>
							 <td style="border : 1px solid black;">주소</td>
							 <td style="border : 1px solid black;">번호</td>
							 <td style="border : 1px solid black;">리뷰</td>
							</tr>
					   </thead>
					   <tbody id="center_tab">
					   </tbody>
					   </table>`).appendTo('#placesList1')
					$(`<ul class="pagination" style="place-content : center;">
						</ul>`).appendTo('#placesList1')
					   
					$.each(list,(i,j)=>{
						$(`<tr style="border : 1px solid black;">
									<td>${j.CNAME}</td>
									<td>${j.CADDR}</td>
									<td>${j.CPHONE}</td>
									<td>${j.CSCORE}</td>
						  </tr> `).appendTo('#center_tab')
					
					})
					if(page.existPrev){
						$(`<li class="page-item"><a class="page-link" href="#">
						   <span aria-hidden="true">&laquo;</span>
						   <span class="sr-only">Previous</span>
						   </a>
						   </li>`).prependTo('ul[class="pagination"]').click(e=>{
							   e.preventDefault()
							   alert('이전클릭')
							   center_table({currPage : page.prevBlock})
						   })
					}
					for(let i = page.startPage; i<=page.endPage;i++){
						$(`<li class="page-item"><a class="page-link" href="#">${i+1}</a></li>`)
						.appendTo('ul[class="pagination"]')
						.click(function(e){
							e.preventDefault()
							center_table({currPage : i})
							$('html').scrollTop(0)
						})
					}
					if(page.existNext){
						$(`<li class="page-item">
						   <a class="page-link" href="#" aria-label="Next">
						   <span aria-hidden="true">&raquo;</span>
						   <span class="sr-only">Next</span>
						   </a>
						   </li>`).appendTo('ul[class="pagination"]').click(e=>{
							   e.preventDefault()
							   alert('다음 클릭')
							   center_table({currPage : page.nextBlock})
						   })
					}
				})
			}
			let mapUi =()=>{
				let mapContainer = document.getElementById('map'),
				mapOptions = { 
					center: new kakao.maps.LatLng(37.559965,126.942345), 
					level: 3 ,
				}
				map = new kakao.maps.Map(mapContainer, mapOptions);
				map.setMapTypeId(daum.maps.MapTypeId.ROADMAP);
				$('<input/>',{type : 'text', id : 'input_search'})
				.css({'padding-top' : '8px','padding-bottom' : '8px','margin-right' :'5px'})
				.appendTo('.search').keypress(function(e){if (e.keyCode === 13){
					e.preventDefault()
					new kakao.maps.services.Places()
					.keywordSearch(
						document.getElementById('input_search').value,
						function (data,status,pagination){
							if(status === kakao.maps.services.Status.OK){
								let bounds = new kakao.maps.LatLngBounds()
								for(let i=0; i<data.length;i++){
									displayMarker(data[i])
									bounds.extend(new kakao.maps.LatLng(data[i].y, data[i].x))
								}
								map.setBounds(bounds)
							}
						}
					)
				}})

				$('<button/>',{text : '검색',type : 'submit'})
				.css({'padding-top' :'15px','padding-bottom' :'15px'})
				.addClass('btn btn-danger')
				.appendTo('.search')
				.click(e=>{
					$('.card').remove()
					center_table({currPage : 0})
					new kakao.maps.services.Places()
					.keywordSearch(
						document.getElementById('input_search').value,
						function (data,status,pagination){
							if(status === kakao.maps.services.Status.OK){
								let bounds = new kakao.maps.LatLngBounds()
								for(let i=0; i<data.length;i++){
									displayMarker(data[i])
									bounds.extend(new kakao.maps.LatLng(data[i].y, data[i].x))
								}
								map.setBounds(bounds)
							}
						}
					)
				})
				
				let markerPosition = new kakao.maps.LatLng(37.559965,126.942345)
		        let marker = new kakao.maps.Marker({
		            position: markerPosition
		        })
		        marker.setMap(map)
		        setOverlayMapTypeId()

			}
			let searchPlaces =x=>{
				$('#searchButton').click(e=>{
				alert(x.key)
				e.preventDefault()
				var ps = new kakao.maps.services.Places(); 
				ps.keywordSearch(x.key, placesSearchCB);
				function placesSearchCB (data, status) {
					places = data
					console.log(places)
					if (status === kakao.maps.services.Status.OK) {
						var bounds = new kakao.maps.LatLngBounds();
						for (var i=0; i<data.length; i++) {
							markerr(data[i],x.map);    
							bounds.extend(new kakao.maps.LatLng(data[i].y, data[i].x));
						}       
						map.setBounds(bounds);
					} 
				}
			})
			}
			
			let displayMarker =place=>{
				let infowindow = new kakao.maps.InfoWindow({zIndex:1})
				let marker = new kakao.maps.Marker({
					map: map,
					position: new kakao.maps.LatLng(place.y, place.x)
				})
				markers.push(marker);
				kakao.maps.event.addListener(marker, 'mouseover',() =>{
					infowindow.setContent(`<div style="padding:5px;font-size:12px;color:black;">${place.place_name}</div>`);
					infowindow.open(map, marker);
				})
				kakao.maps.event.addListener(marker, 'mouseout',() =>{
					infowindow.close()
				})
			}

				

			let markerr = (place,map) =>{
				let infowindow = new kakao.maps.InfoWindow({zIndex:1})
				let marker = new kakao.maps.Marker({
					map: map,
					position: new kakao.maps.LatLng(place.y, place.x) 
				});
				markers.push(marker)
				kakao.maps.event.addListener(marker, 'click', function() {
					alert(place.place_name)
					infowindow.close();
				});
				kakao.maps.event.addListener(marker, 'mouseover', function() {
					infowindow.setContent('<div style="padding:5px;font-size:12px;">' + place.place_name + '</div>');
					infowindow.open(map, marker);
				});
				kakao.maps.event.addListener(marker, 'mouseout', function() {
					infowindow.close();
				});
				kakao.maps.event.addListener(marker, 'rightclick', function() {
					marker.setMap(null)
					infowindow.close();
				})
			}
			return { onCreate }
		})()