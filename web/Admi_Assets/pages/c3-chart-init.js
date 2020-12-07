/*
 Template Name: Stexo - Responsive Bootstrap 4 Admin Dashboard
 Author: Themesdesign
 Website: www.themesdesign.in
 File: C3 Chart init js
 */

!function($) {
    "use strict";

    var ChartC3 = function() {};

    ChartC3.prototype.init = function () {
        //generating chart 
        c3.generate({
            bindto: '#chart',
            data: {
                columns: [
                    ['Desktop', 150, 100, 90, 152, 250, 95],
                    ['Mobile', 230, 150, 120, 240, 180, 150],
                    ['Tablet', 300, 200, 250, 350, 150, 250]
                ],
                type: 'bar',
                colors: {
                    Desktop: '#fcbe2d',
                    Mobile: '#02c58d',
                    Tablet: '#30419b'
                }
            }
        });

        //combined chart
        c3.generate({
            bindto: '#combine-chart',
            data: {
                columns: [
                    ['Mascotas', 80, 20, 120, 80, 40, 90],
                    ['Niños', 200, 130, 90, 200, 130, 220],
                    ['Jovenes', 300, 200, 160, 300, 300, 230],
                    ['Adultos', 250, 160, 80, 180, 250, 120],
                    ['Vehiculos', 160, 120, 160, 140, 80, 130]
                ],
                types: {
                    Mascotas: 'bar',
                    Niños: 'bar',
                    Jovenes: 'spline',
                    Adultos: 'line',
                    Vehiculos: 'bar'
                },
                colors: {
                    Mascotas: '#02c58d',
                    Niños: '#30419b',
                    Jovenes: '#fcbe2d',
                    Adultos: '#fc5454',
                    Vehiculos: '#59c6fb'
                },
                groups: [
                    ['Mascotas','Niños']
                ]
            },
            axis: {
                x: {
                    type: 'censo'
                }
            }
        });
        
        //roated chart
        c3.generate({
            bindto: '#roated-chart',
            data: {
                columns: [
                ['Hombre', 60, 120, 180, 300, 90, 180],
                ['Mujer', 40, 30, 10, 20, 50, 30]
                ],
                types: {
                    Hombre: 'bar'
                },
                colors: {
                    Hombre: '#02c58d',
                    Mujer: '#30419b'
	            }
            },
            axis: {
                rotated: true,
                x: {
                type: 'categorized'
                }
            }
        });

        //stacked chart
        c3.generate({
            bindto: '#chart-stacked',
            data: {
                columns: [
                    ['Revenue', 130, 120, 150, 120, 160, 150, 250, 120, 180, 140, 160, 150],
                    ['Pageview', 10, 150, 90, 240, 130, 220, 200, 130, 90, 240, 130, 220]
                ],
                types: {
                    Revenue: 'area-spline',
                    Pageview: 'area-spline'
                    // 'line', 'spline', 'step', 'area', 'area-step' are also available to stack
                },
                colors: {
                    Revenue: '#f0f4f7',
                    Pageview: '#30419b'
                }
            }
        });
        
        //Donut Chart
        c3.generate({
             bindto: '#donut-chart',
            data: {
                columns: [
                    ['Desktops', 80],
                    ['Smart Phones', 55],
                    ['Mobiles', 40],
                    ['Tablets', 55]
                ],
                type : 'donut'
            },
            donut: {
                title: "Candidates",
                width: 30,
				label: { 
					show:false
				}
            },
            color: {
            	pattern: ['#30419b', "#f0f4f7", '#02c58d', '#fcbe2d']
            }
        });
        
        //Pie Chart
        c3.generate({
             bindto: '#pie-chart',
            data: {
                columns: [
                    ['Multas', 48],
                    ['Activas', 20],
                    ['Canceladas', 32]
                ],
                type : 'pie'
            },
            color: {
                pattern: ["#30419b", "#f0f4f7","#fcbe2d"]
            },
            pie: {
		        label: {
		          show: false
		        }
		    }
        });

    },
    $.ChartC3 = new ChartC3, $.ChartC3.Constructor = ChartC3

}(window.jQuery),

//initializing 
function($) {
    "use strict";
    $.ChartC3.init()
}(window.jQuery);



