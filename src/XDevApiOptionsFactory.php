<?php

declare(strict_types=1);

namespace ShaunFreeman\PhpMysqlXdevapi;

use Psr\Container\ContainerInterface;

final class XDevApiOptionsFactory
{
    public function __invoke(ContainerInterface $container): XDevApiOptions
    {
        $xDevApiOptions = $container->get('config')['xdevapi'] ?? $container->get('xdevapi') ?? [];
        $xDevApiOptions = XDevApiOptions::fromArray($xDevApiOptions);

        return $xDevApiOptions;
    }
}
