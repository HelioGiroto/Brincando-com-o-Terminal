(function(){'use strict';var f="function"==typeof Object.create?Object.create:function(a){function b(){}b.prototype=a;return new b},h;if("function"==typeof Object.setPrototypeOf)h=Object.setPrototypeOf;else{var k;a:{var l={h:!0},m={};try{m.__proto__=l;k=m.h;break a}catch(a){}k=!1}h=k?function(a,b){a.__proto__=b;if(a.__proto__!==b)throw new TypeError(a+" is not extensible");return a}:null}var n=h;
function p(a,b){a.prototype=f(b.prototype);a.prototype.constructor=a;if(n)n(a,b);else for(var c in b)if("prototype"!=c)if(Object.defineProperties){var d=Object.getOwnPropertyDescriptor(b,c);d&&Object.defineProperty(a,c,d)}else a[c]=b[c]}var q=this||self;
function r(a){var b=typeof a;if("object"==b)if(a){if(a instanceof Array)return"array";if(a instanceof Object)return b;var c=Object.prototype.toString.call(a);if("[object Window]"==c)return"object";if("[object Array]"==c||"number"==typeof a.length&&"undefined"!=typeof a.splice&&"undefined"!=typeof a.propertyIsEnumerable&&!a.propertyIsEnumerable("splice"))return"array";if("[object Function]"==c||"undefined"!=typeof a.call&&"undefined"!=typeof a.propertyIsEnumerable&&!a.propertyIsEnumerable("call"))return"function"}else return"null";
else if("function"==b&&"undefined"==typeof a.call)return"object";return b}function t(a){var b=["mys","design","init"],c=q;b[0]in c||"undefined"==typeof c.execScript||c.execScript("var "+b[0]);for(var d;b.length&&(d=b.shift());)b.length||void 0===a?c[d]&&c[d]!==Object.prototype[d]?c=c[d]:c=c[d]={}:c[d]=a}function u(a,b){function c(){}c.prototype=b.prototype;a.prototype=new c;a.prototype.constructor=a};/*

 Copyright The Closure Library Authors.
 SPDX-License-Identifier: Apache-2.0
*/
function v(){}var w="function"==typeof Uint8Array;function x(a,b,c){a.b=null;b||(b=[]);a.j=void 0;a.f=-1;a.a=b;a:{if(b=a.a.length){--b;var d=a.a[b];if(null!==d&&"object"==typeof d&&"array"!=r(d)&&!(w&&d instanceof Uint8Array)){a.g=b-a.f;a.c=d;break a}}a.g=Number.MAX_VALUE}a.i={};if(c)for(b=0;b<c.length;b++)if(d=c[b],d<a.g)d+=a.f,a.a[d]=a.a[d]||y;else{var e=a.g+a.f;a.a[e]||(a.c=a.a[e]={});a.c[d]=a.c[d]||y}}var y=[];
function z(a,b){if(b<a.g){b+=a.f;var c=a.a[b];return c===y?a.a[b]=[]:c}if(a.c)return c=a.c[b],c===y?a.c[b]=[]:c}function A(a){a=z(a,2);return null==a?0:a}function B(a,b){a=z(a,b);a=null==a?a:!!a;return null==a?!1:a}function C(a,b,c){a.b||(a.b={});if(!a.b[c]){var d=z(a,c);d&&(a.b[c]=new b(d))}return a.b[c]}function D(a){if(a.b)for(var b in a.b){var c=a.b[b];if("array"==r(c))for(var d=0;d<c.length;d++)c[d]&&E(c[d]);else c&&E(c)}}function E(a){D(a);return a.a}
v.prototype.toString=function(){D(this);return this.a.toString()};function F(a){x(this,a,G)}u(F,v);var G=[17];function H(a){x(this,a,I)}u(H,v);var I=[27];function M(a){x(this,a,N)}u(M,v);var N=[8];function O(){};function P(a,b){a=a.getElementsByTagName("META");for(var c=0;c<a.length;++c)if(a[c].getAttribute("name")===b)return a[c].getAttribute("content");return""}function Q(a,b,c){for(var d=a.getElementsByTagName("META"),e=0;e<d.length;++e)if(d[e].getAttribute("name")===b){d[e].setAttribute("content",c);return}d=document.createElement("META");d.setAttribute("name",b);d.setAttribute("content",c);a.appendChild(d)};function R(a,b){this.b=a;this.a=b;a=P(b,"namespace");a||(a="ns-"+Math.random().toString(36).substr(2,5),Q(b,"namespace",a))}function S(a,b){b=new CustomEvent(b);a.a.dispatchEvent(b)};function T(){this.a={};this.b={};this.c={}}T.prototype.set=function(a,b){this.a[a]=b};T.prototype.get=function(a){return this.a[a]};function U(a,b){if(b){b=JSON.parse(b);for(var c in b)a.set(c,b[c])}};function V(){this.a=new T}p(V,O);function W(a,b){this.b=a;this.a=b}function aa(a){if(!mys.Engine)throw Error("MysidiaJsError[2] ");var b=a.a.b,c=a.a.a;U(a.b.a,P(c,"runtime_data"));var d=P(c,"render_config");if(!d)throw Error("MysidiaJsError[35] ");var e=new M(d?JSON.parse(d):null),g=mys.Engine.create(b,c,E(e)),J=0;c.addEventListener("browserRender",function(){++J;if(1==J)S(a.a,"overallStart"),ba(a,e),g.enable().then(function(){S(a.a,"overallQuiet")});else{var K=c.clientWidth,L=c.clientHeight;K&&L&&g.enable(K,L)}})}
function ba(a,b){if(!(2==A(b)||C(C(b,H,1),F,10)&&B(C(C(b,H,1),F,10),16))){var c=a.a.a;c.addEventListener("browserStart",function(){if(C(C(b,H,1),F,10)&&B(C(C(b,H,1),F,10),15)){var d=a.b.a;for(var e in d.c)d.a.hasOwnProperty(e)||d.set(e,JSON.stringify(d.c[e]));for(var g in d.b)d.a.hasOwnProperty(g)||d.set(g,JSON.stringify(d.b[g]));(d=(d=JSON.stringify(d.a))&&"{}"!=d?d:"")&&Q(c,"runtime_data",d)}});c.addEventListener("browserReady",function(){});c.addEventListener("browserQuiet",function(){})}};function X(){V.apply(this,arguments)}p(X,V);function Y(a){X.call(this,a)}p(Y,X);function Z(){Y.apply(this,arguments)}p(Z,Y);(function(a){t(function(b,c){b=new R(b,c);c=a(b);aa(new W(c,b))})})(function(a){return new Z(a)});}).call(this);