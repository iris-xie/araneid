package admin

import (
	_ "fmt"
	_ "github.com/beatrice950201/araneid/controllers"
	_ "github.com/beatrice950201/araneid/extend/service"
)

/** 蜘蛛池栏目转换工具 **/
type Adapter struct {
	Main
}

// @router /adapter/index [get,post]
func (c *Adapter) Index() {}
